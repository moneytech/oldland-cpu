.globl _start
_start:
	b	init
	/* Offsets from here to the version strings, not executable code. */
	.long	cpu_version
	.long	date

init:
	movhi	$r0, %hi(ex_table)
	orlo	$r0, $r0, %lo(ex_table)
	scr	0, $r0
	/*
	 * Wait for the SDRAM to be configured.  The controller lives at
	 * 0x800001000, bit 0 in any register in the 4KB space indicates
	 * configuration is done.
	 */
	movhi	$r3, 0x8000
	orlo	$r2, $r3, 0x1000
config_loop:
	ldr32	$r1, [$r2, 0]
	cmp	$r1, 0x0
	beq	config_loop
	xor	$r2, $r2, $r2

	/*
	 * Register allocation:
	 *
	 * r5: application length, in bytes.
	 * r4: received bytes.
	 * r3: peripheral base.
	 * r2: destination address (always starts at 0x00000000).
	 *
	 * Bootloader protocol:
	 *
	 * 1. Bootrom sends an 'A' packet to signal ready to receive.
	 * 2. Remote sends the application length as a 32-bit big-endian length
	 * (in bytes), the bootrom sends an 'A' as an ack after each byte.
	 * 3. Remote sends data byte.
	 * 4. Bootrom sends an 'A' as an ack.
	 * 5. Repeat 3-4 until loaded.
	 * 6. Bootrom jumps to application.
	 */

	/* Awake and ready to receive. */
	call	send_ack

	xor	$r1, $r1, $r1
	/* Read the length. */
next_length_byte:
	lsl	$r5, $r5, 8
	call	read_char
	or	$r5, $r5, $r0
	add	$r1, $r1, 1
	call	send_ack
	cmp	$r1, 4
	bne	next_length_byte

	/* We have the length, start receiving the data. */
next_data_byte:
	cmp	$r2, $r5
	beq	done
	call	read_char
	str8	$r0, [$r2, 0x0]
	add	$r2, $r2, 1
	call	send_ack
	b	next_data_byte

done:
	call	cache_sync

	/* Be friendly and set the registers to zero. */
	xor	$r0, $r0, $r0
	xor	$r1, $r1, $r1
	xor	$r2, $r2, $r2
	xor	$r3, $r3, $r3
	xor	$r4, $r4, $r4
	xor	$r5, $r5, $r5
	xor	$lr, $lr, $lr
	xor	$sp, $sp, $sp
	/* Here we go! */
	b	$r0

cache_sync:
	xor	$r0, $r0, $r0
sync_loop:
	cmp	$r0, $r2
	bgt	sync_done
	cache	$r0, 2		/* Flush data cache line. */
	cache	$r0, 0		/* Invalidate instruction cache line. */
	add	$r0, $r0, 32

	b	sync_loop

sync_done:
	ret


	/*
	 * Read the next character.  Clobbers $r0.
	 */
read_char:
	ldr32	$r0, [$r3, 0x0004] # Read status reg
	and	$r0, $r0, 0x2
	cmp	$r0, 0x2	# RX data ready
	bne	read_char
	ldr32	$r0, [$r3, 0x0000]
	ret

	/*
	 * Send the ack packet.  Clobbers $r0.
	 */
send_ack:
	mov	$r0, 0x41 # 'A'
	str32	$r0, [$r3, 0x0000]
not_empty:
	ldr32	$r0, [$r3, 0x0004]
	and	$r0, $r0, 0x1
	cmp	$r0, 1
	bne	not_empty

	ret

bad_vector:
	b	bad_vector

	.balign	64
ex_table:
	b	_start		/* RESET */
	b	bad_vector	/* ILLEGAL_INSTR */
	b	bad_vector	/* SWI */
	b	bad_vector	/* IRQ */
	b	bad_vector	/* IFETCH_ABORT */
	b	bad_vector	/* DATA_ABORT */
