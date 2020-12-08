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

PollController:
  lda #$01
  sta CONTROLLER_1
  lda #$00
  sta CONTROLLER_1
  ldx #$08
PollControllerLoop:
  lda CONTROLLER_1
  lsr
  rol controller1
  lda CONTROLLER_2
  lsr
  rol controller2
  dex
  bne PollControllerLoop
    lda controller1
    ora controller2
    sta controller1
    rts

UpdateController:
  lda controller1
  sta controllerLastFrame
  jsr PollController
  jsr CheckRight
  jsr CheckLeft
  jsr CheckUp
  jsr CheckDown
  jsr CheckA
  jsr CheckB
  jsr CheckStart
  jsr CheckSelect
  rts

CheckRight:
  lda controller1
  and #BUTTON_RIGHT
  beq CheckRightDone
    lda controller1
    and #BUTTON_LEFT
    bne CheckRightDone
      lda controllerLastFrame
      and #BUTTON_RIGHT
      bne CheckRightDone
        ldx #$03
        jsr IncPaletteVal
CheckRightDone:
  rts

CheckLeft:
  lda controller1
  and #BUTTON_LEFT
  beq CheckLeftDone
    lda controller1
    and #BUTTON_RIGHT
    bne CheckLeftDone
      lda controllerLastFrame
      and #BUTTON_LEFT
      bne CheckLeftDone
        ldx #$03
        jsr DecPaletteVal
CheckLeftDone:
  rts

CheckUp:
  lda controller1
  and #BUTTON_UP
  beq CheckUpDone
    lda controller1
    and #BUTTON_DOWN
    bne CheckUpDone
      lda controllerLastFrame
      and #BUTTON_UP
      bne CheckUpDone
        ldx #$01
        jsr IncPaletteVal
CheckUpDone:
  rts

CheckDown:
  lda controller1
  and #BUTTON_DOWN
  beq CheckDownDone
    lda controller1
    and #BUTTON_UP
    bne CheckDownDone
      lda controllerLastFrame
      and #BUTTON_DOWN
      bne CheckDownDone
        ldx #$01
        jsr DecPaletteVal
CheckDownDone:
  rts

CheckA:
  lda controller1
  and #BUTTON_A
  beq CheckADone
    lda controller1
    and #BUTTON_B
    bne CheckADone
      lda controllerLastFrame
      and #BUTTON_A
      bne CheckADone
        ldx #$00
        jsr IncPaletteVal
CheckADone:
  rts

CheckB:
  lda controller1
  and #BUTTON_B
  beq CheckBDone
    lda controller1
    and #BUTTON_A
    bne CheckBDone
      lda controllerLastFrame
      and #BUTTON_B
      bne CheckBDone
        ldx #$00
        jsr DecPaletteVal
CheckBDone:
  rts

CheckStart:
  lda controller1
  and #BUTTON_START
  beq CheckStartDone
    lda controllerLastFrame
    and #BUTTON_START
    bne CheckStartDone
      jsr InitializePortraitVars
CheckStartDone:
  rts

CheckSelect:
  lda controller1
  and #BUTTON_SELECT
  beq CheckSelectDone
    lda controllerLastFrame
    and #BUTTON_SELECT
    bne CheckSelectDone
      jsr InitializePortraitVars
CheckSelectDone:
  rts
