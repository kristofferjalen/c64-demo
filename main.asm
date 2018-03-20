*=$0801 "Basic upstart"
:BasicUpstart($0900)

*=$0900 "Program"

    jsr $ff81				// Clear screen

	lda #$00
	tax
	tay
	jsr $1000 				// Init music

	jsr bitmap.init
	jsr scrolltext.init
	jsr irq.init
	jmp *

#import "bitmap.asm"
#import "scrolltext.asm"
#import "irq.asm"

.pc = $1000-$7e "Music"
.import binary "Music/Zilltunna.sid"

.pc = $2000 "Charset"
.import c64 "Graphics/action_wave.64c"

.pc = $6000-2 "Bitmap"
.import binary "Graphics/tretton37.prg"