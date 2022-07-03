; homex.g
; called to home the X axis
;
;-------------------------------------------
; XY homing speed shouldn't be too high to
; prevent damaging or moving microswith
; endstop mounts
;-------------------------------------------
M400
G91						; relative positioning
G1 H2 Z10 F1200			; lift Z relative to current position
G1 H1 X-250 F3600		; move quickly to X axis endstop and stop there (first pass)
;G1 H2 X10 F3600			; go back a few mm
;G1 H1 X-250 F600		; move slowly to X axis endstop once more (second pass)
G1 H2 Z-10 F420			; lower Z again
G90						; absolute positioning
M400
