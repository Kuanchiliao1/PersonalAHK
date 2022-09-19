Global InTopic := "true"
Global start := 0
Global end := 0
; send {CtrlDown}gc{CtrlUp} ; To copy element ID

~^l:: 
  Send, ^l
  InTopic := "true"
  return



:*:measure,.::
  loop {
    start := A_TickCount
    end := A_TickCount
    time := end - start
    msgbox % time
  }
return

; Sleep, 1500
; end := A_TickCount
; end := end - start
; MsgBox, 64, Seconds elapsed, %end%

; Flow
; User starts the script with "measure,." hotkey
; Time starts counting up
; Time resets and gets recorded when ctrl+l is pressed and user goes to next topic
; 