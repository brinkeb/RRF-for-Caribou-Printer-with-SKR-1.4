; Configuration file for SKR v1.4 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.3-LPC-1 on Thu Aug 13 2020 09:40:16 GMT+0100 (British Summer Time)

; General preferences
G90                                            ; send absolute coordinates...
M83                                            ; ...but relative extruder moves
M550 P"duet3"             ; set printer name

; Network
;M552 S1                                        ; enable network and acquire dynamic address via DHCP
;M586 P0 S1                                     ; enable HTTP
;M586 P1 S0                                     ; disable FTP
;M586 P2 S0                                     ; disable Telnet

; Drives
M569 P0 S1 D3 V40                              ; physical drive 0 goes forwards using default driver timings
M569 P1 S1 D3 V40                              ; physical drive 1 goes forwards using default driver timings
M569 P2 S1 D3 V40                              ; physical drive 2 goes forwards using default driver timings
M569 P3 S0									   ; physical drive 3 goes forwards using default driver timings
M569 P4 S1 D3 V40                              ; physical drive 4 goes forwards using default driver timings
M584 X0 Y1 Z4:2 E3                             ; set drive mapping
M671 X-36:300 Y0:0 S1   					   ; set leadscrews potions (for z levelling)
M350 X16 Y16 Z16 E16 I1                        ; configure microstepping with interpolation
M92 X100.00 Y100.00 Z400.00 E415.00            ; set steps per mm
M566 X900.00 Y900.00 Z12.00 E120.00            ; set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y10000.00 Z1200.00 E7200.00     ; set maximum speeds (mm/min)
M201 X1250.00 Y1250.00 Z200.00 E10000.00       ; set accelerations (mm/s^2)
M906 X1100 Y850 Z750 E800 I30                  ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                        ; Set idle timeout

; Axis Limits
M208 X0 Y-4 Z0 S1                              ; set axis minima
M208 X250 Y210 Z210 S0                         ; set axis maxima


; Endstops
M574 X1 S1 P"xstop"                           ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                           ; configure active-high endstop for high end on Y via pin ystop
M574 Z1 S2                                     ; configure Zstop as BLTouch
;M574 X Y S3									   ; configure X Y for sensorless homing;
;M915 X Y R0 F0                                 ; configure X Y for sensorless homing

; Z-Probe (BLTouch)
M558 P9 H6 F120 T8000 X0 Y0 Z1 C"^probe"       ; disable Z probe but set dive height, probe speed and travel speed
M950 S0 C"servo0"                              ; Setup servo 0 as servo port on SKR
M557 X18:233 Y5:157 S43:30                     ; define mesh grid
G31 X-14.8 Y-42.7 Z2.01		                   ; Probe Offset

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138 					; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                              					; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                               					; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                        					; map heated bed to heater 0
M143 H0 S100                                   					; set temperature limit for heater 0 to 100C
M308 S1 P"e0temp" Y"thermistor" T100000 B4138  					; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           					; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                               					; disable bang-bang mode for heater  and set PWM limit
M307 H0 A134.8 C511.7 D4.7 V0.0 B0 
M307 H1 A540.1 C214.5 D4.9 V0.0 B0 
;M308 S2 P"e1temp" Y"thermistor" A"Chamber Temp" T100000 B4138  	; configure sensor 2 as thermistor on pin e1temp
;M950 H2 C"e1heat" T2                           				; create Chmber heater output on e0heat and map it to sensor 2
;M307 H2 B0 S1.00
;M305 S"Chamber temp" P103 T100000 B4138 C0 R2200 X1 ; Case temp 100k semtek on E0 thermistor input.

; Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1 C"Part Cooling"                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"e1heat" T1                           ; create extruder fan output (2.4) on e1heat and map it to sensor 1 (T1)
M106 P1 R1 H1 T45 C"Hotend Cooling"            ; thermostatically 45C controlled fan from T1 sensor

; Tools
M563 P0 D0 H1 F0                               ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M575 P1 S3 B57600                              ; enable support for PanelDue (BTT TFT35)

;M501
T0