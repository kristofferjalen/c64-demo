.filenamespace scrolltext

pixelscroll:
	.byte $07

init:
	// Set color to characters
	lda #$01
	ldx #39
!:	sta $db98,x
	dex
	bpl !-
	
	lda #<message
	ldy #>message
	sta nextchar+1
	sty nextchar+2

	rts

update:
	// soft (pixel) scroll eight times
	dec pixelscroll
	beq !+
	rts

	// hard (char) scroll
!:	lda #$07
	sta pixelscroll
	
	// move all chars
.for (var x = 0; x < 40; x++) {
	lda $0798 + x + 1
 	sta $0798 + x
}

	// insert a new char to the right
nextchar:
	lda $0798+$27
	cmp #$00						// last char in text?
	bne !+
	lda #<message
	ldy #>message
	sta nextchar+1
	sty nextchar+2
	jmp nextchar

!:	sta $0798+$27
	inc nextchar+1
	lda nextchar+1
	bne !+
	inc nextchar+2
!:
	rts

message:
	.text "here goes my scrolltext!"
	.text "                        "
	.byte 0