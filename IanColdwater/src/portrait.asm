; Copyright (C) 2020, Vi Grey
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions
; are met:
;
; 1. Redistributions of source code must retain the above copyright
;    notice, this list of conditions and the following disclaimer.
; 2. Redistributions in binary form must reproduce the above copyright
;    notice, this list of conditions and the following disclaimer in the
;    documentation and/or other materials provided with the distribution.
;
; THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
; SUCH DAMAGE.

DrawPortrait:
  jsr InitializePortraitVars
  jsr DrawPortraitNametable 
  lda #$01
  sta needDraw
  jsr SetPalette
  rts

DrawPortraitNametable:
  lda #<(PortraitNametable)
  sta addr
  lda #>(PortraitNametable)
  sta (addr + 1)
  ldy #$00
  ldx #$04
  lda PPU_STATUS
  lda #$20
  sta PPU_ADDR
  sty PPU_ADDR
DrawPortraitNametableLoop:
  lda (addr), Y
  sta PPU_DATA
  iny
  bne DrawPortraitNametableLoop
    inc (addr + 1)
    dex
    bne DrawPortraitNametableLoop
      rts

InitializePortraitVars:
  lda #$0F
  sta (palettes + 3)
  lda #$05
  sta (palettes + 2)
  lda #$0E 
  sta (palettes + 1)
  lda #$10
  sta palettes
  lda #$01
  sta needDraw
  rts

SetPalette:
  lda PPU_STATUS
  lda #$3F
  sta PPU_ADDR
  lda #$00
  sta PPU_ADDR
  ldx #$03
SetPaletteLoop:
  lda #$2d
  sta PPU_DATA
  lda #$36
  sta PPU_DATA
  lda palettes, X
  tay
  lda PaletteList, Y
  sta PPU_DATA
  lda #$0F
  sta PPU_DATA
  dex
  bpl SetPaletteLoop
    jsr ResetScroll
    rts

IncPaletteVal:
  inc palettes, X
  lda palettes, X
  cmp #$36
  bcc IncPaletteValDone
    lda #$00
    sta palettes, X
IncPaletteValDone:
  lda #$01
  sta needDraw
  rts

DecPaletteVal:
  dec palettes, X
  bpl DecPaletteValDone
    lda #$35
    sta palettes, X
DecPaletteValDone:
  lda #$01
  sta needDraw
  rts

PaletteList:
  .byte $0F, $2D, $00, $10, $3D, $30
  .byte $01, $11, $21, $31
  .byte $02, $12, $22, $32
  .byte $03, $13, $23, $33
  .byte $04, $14, $24, $34
  .byte $05, $15, $25, $35
  .byte $06, $16, $26, $36
  .byte $07, $17, $27, $37
  .byte $08, $18, $28, $38
  .byte $09, $19, $29, $39
  .byte $0A, $1A, $2A, $3A
  .byte $0B, $1B, $2B, $3B
  .byte $0C, $1C, $2C, $3C

PortraitNametable:
  .incbin "graphics/portrait.nam"
