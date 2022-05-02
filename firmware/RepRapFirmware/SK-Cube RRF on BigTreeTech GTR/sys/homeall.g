; homeall.g
; called to home all axes
;
M400
G91						; relative positioning
G1 H2 Z10 F1200			; lift Z relative to current position
;-------------------------------------------
; Home X
;-------------------------------------------
G1 H1 X-250 F6000		; move quickly to X axis endstop and stop there (first pass)
;G1 H2 X5 F3600			; go back a few mm
;G1 H1 X-250 F600		; move slowly to X axis endstop once more (second pass)
;-------------------------------------------
; Home Y
;-------------------------------------------
G1 H1 Y-250 F6000		; move quickly to X axis endstop and stop there (first pass)
;G1 H2 Y5 F3600			; go back a few mm
;G1 H1 Y-250 F600		; move slowly to X axis endstop once more (second pass)
;-------------------------------------------
G90                     ; absolute positioning
G1 X15 Y0 F6000
G30                     ; home Z by probing the bed
G1 Z10
M400
