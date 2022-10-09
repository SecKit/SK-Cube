; Configuration file for BigTreeTech Octopus Pro (F429) v1.0 
; executed by the firmware on start-up

; General preferences
G21                                                     ; set units to millimeters
G90                                                     ; send absolute coordinates...
M83                                                     ; ...but relative extruder moves
M550 P"SK-Cube RRF"                                     ; set printer name
M669 K1                                                 ; select CoreXY mode

; Network
M552 S1                                                 ; enable network
M586 P0 S1                                              ; enable HTTP
M586 P1 S0                                              ; disable FTP
M586 P2 S0                                              ; disable Telnet



; Drives
M569 P0 S0                                              ; L. physical drive 0 goes backwards using default driver timings
M569 P1 S0                                              ; R. physical drive 1 goes backwards using default driver timings
M569 P2 S1                                              ; Z-L. physical drive 2 goes forwards using default driver timings
M569 P3 S0                                              ; Z-R. physical drive 3 goes backwards using default driver timings
M569 P4 S1                                              ; Z-C. physical drive 4 goes forwards using default driver timings
M569 P5 S1                                              ; E. physical drive 5 goes forwards using default driver timings

M584 X0 Y1 Z2:3:4 E5                                    ; set drive mapping
M671 X3:215:110 Y3:3:217 S50                            ; set z drive coordinates
M350 X16 Y16 Z16:16:16 E16 I1                           ; configure microstepping with interpolation
M92  X100.00 Y100.00 Z2000.00 E390.00                   ; set steps per mm
M566 X450.00 Y450.00 Z24.00 E450.00                     ; set maximum instantaneous speed changes (mm/min)
M203 X30000.00 Y30000.00 Z420.00 E10000.00              ; set maximum speeds (mm/min)
M201 X4000.00 Y4000.00 Z200.00 E2000.00                 ; set accelerations (mm/s^2)
M906 X800 Y800 Z600 E800 I30                            ; set motor currents (mA) and motor idle factor in per cent
M84  S30                                                ; Set idle timeout

; Axis Limits
M208 X-1:205 Y-1:205 Z-5:200                            ; set axis limits

; Endstops
M574 X1 S1 P"xstop"                                     ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                     ; configure active-high endstop for low end on Y via pin ystop

; Inductive Probe
M574 Z1 S2												; configure active-high endstop for low end on Z via pin zstop
M558 P5 C"zstop" I1 H5 F600 T15000 A1                   ; set Z probe type as filtered digital (P5), dive height to 10.
;-------------------------------------------
; set the "Z" value here according to your measurement by paper method or else.
G31 P500 X0 Y35 Z1.4                                    ; set Z probe trigger value, offset and trigger height
;-------------------------------------------
M557 X5:205 Y38:195 P5:5                                 ; define min & max coord, number of points of mesh grid


; Filament sensor
; Wire polarity of the sensor might be different batch by batch.
; Please open the sensor case and double check before enabling it.
;
; M591 D0 P2 C"xstopmax" S1

; Heaters
M308 S0 P"bedtemp" Y"thermistor" A"Bed heater" T100000 B3950 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                                       ; create bed heater output on bed and map it to sensor 0
M307 H0 R0.816 C379.2 D3.37 S1.00 V0.0
M140 H0                                                 ; map heated bed to heater 0
M143 H0 S120                                            ; set temperature limit for heater 0 to 120C

M308 S1 P"e0temp" Y"thermistor" A"Tool0 heater" T100000 B4725 C7.06e-8  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                    ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 R2.296 C86.2 D5.14 S1.00 V0.0
M143 H1 S280                                            ; set temperature limit for heater 1 to 280C

M308 S2 P"e1temp" Y"thermistor" A"Chamber" T100000 B3950  ; configure sensor 2 as thermistor on pin e1temp
M950 H2 C"e1heat" T2                                    ; create chamber heater output on e1heat and map it to sensor 2
M307 H2 B0 R0.229 C271.8 D14.45 S1.00 V24.0				; Lower duty cycle (eg. S0.5 for 50%) if the thermal switch of PTC heater triggers frequently
M141 H2
M143 H2 S100                                             ; set temperature limit for heater 2 to 75C

; Part cooling fan
M950 F0 C"fan0" Q250                                    ; create fan 0 on pin fan0 and set its frequency.
M106 P0 S0 H-1                                          ; set fan 0 value. Thermostatic control is turned off
; Heatsink fan
M950 F1 C"fan1" Q250                                    ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H1 T50                                       ; set fan 1 value. Thermostatic control is turned on
; Chamber heater fan
M950 F2 C"fan2" Q700                                    ; create fan 2 on pin fan2 and set its frequency
M106 P2 S0 H-1                                          ; set fan 2 value. Thermostatic control is turned off

; Tools
M563 P0 S"Tool0" D0 H1 F0                                ; define tool 0
G10 P0 X0 Y0 Z0                                          ; set tool 0 axis offsets
G10 P0 R0 S0                                             ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M501                                                    ; load saved parameters from non-volatile memory
T0                                                      ; select tool 0
