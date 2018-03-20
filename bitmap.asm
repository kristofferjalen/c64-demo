.filenamespace bitmap

init:
	// Load background color
	lda $8710
	sta $d020
	sta $d021

	ldx #$00
!:
	// Copy to screen RAM
	lda $7f40,x
	sta $5c00,x
	lda $8040,x
	sta $5d00,x
	lda $8140,x
	sta $5e00,x
	lda $8240,x
	sta $5f00,x

	// Copy to color RAM
	lda $8328,x
	sta $d800,x
	lda $8428,x
	sta $d900,x
	lda $8528,x
	sta $da00,x
	lda $8628,x
	sta $db00,x

	inx
	bne !-

	rts