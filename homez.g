; homez.g
; called to home the Z axis
;
; generated by RepRapFirmware Configuration Tool v3.1.3-LPC-1 on Sat Aug 22 2020 17:37:16 GMT+0200 (Mitteleuropäische Sommerzeit)
G91              ; relative positioning
G90              ; absolute positioning
G1 X146 Y144 F3600 
G30              ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91             ; relative positioning
;G1 Z5 F100      ; lift Z relative to current position
;G90             ; absolute positioning

