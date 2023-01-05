SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance force
#InstallKeybdHook
#InstallMouseHook
#KeyHistory 200
#Include ..\Private_Folder\LogTopicExtract.ahk

; Global topic := 1
; Global minute := 1
; Global extract := 1



HasVal(haystack, needle) {
	if !(IsObject(haystack)) || (haystack.Length() = 0)
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
}

; Plan
; Use nested array to store data
; Print out contents of array at the ent

; https://www.autohotkey.com/docs/objects/Object.htm
; - Inside loop
;   - Increment topic seconds count whenever the element window is active, and the wintitle matches
;     - store in variable topic_current_seconds
  

; - Topic counter set to zero when a new topic is detected
;   - Condtions: 
;     - wintitle changes
;     - wintitle matches, but the element window is not active
; - Main key to detect:
;   - extract (alt + x)
;     - add topic_current_seconds value to array
;   - clozes(maybe)#SingleInstance force 




arr := []


F2::
start:=A_TickCount
SetTimer, check, 5000
msgbox % "Timer started"
return


check:
difference:=A_TickCount-start
MsgBox %difference% milliseconds
return


F1::
toggle=1
While toggle
{
WinGetTitle, OutputVar, A
msgbox % OutputVar 

  If !(HasVal(array, OutputVar)) ; If title is not in array, push it in
  {
    arr.push(OutputVar)
    start_topic := A_TickCount
    msgbox % OutputVar "added to array"
    msgbox % arr[1] "added to array??"
    msgbox % arr[2] "added to array??"
  }
  else if (HasVal(array, OutputVar))
  {
  
  }
  else
  {
    msgbox % "Error"
  }

  msgbox teseting
}
return

Esc:: ExitAPP

; Topic #A : 2 extracts, 35s
; Topic #C : 3 extracts, 60s || extra info: 1st extract @35s, 2nd extract @40s, 3rd extract @45s => SD is 5

; Topic #D : 3 extracts, 60s || extra info: 1st extract @5s, 2nd extract @10s, 3rd extract @45s => SD is 21.8

; Topic #E : 3 extracts, 60s || extra info: 1st extract @5s, 2nd extract @10s, 3rd extract @60s => SD is 30.4

; Topic #F : 1 extracts, 60s || extra info: 1st extract @5s => Precosity is 5/60 = 0.083(this is a higher precosity, like priority)
; Precosity/char counts of extract(more chars within the same precosity means higher learntropy)

; Topic #B : 3 extracts, time on topic




; send {CtrlDown}gc{CtrlUp} ; To copy element ID

; Add logextract(A_THISHOTKEY) to your extract and next topic hotkeys


:*:calculation,.::
loop {
  sleep 1000
  tooltip % extract / (topic / minute) . "extract/topic/minute"
}
return



^a::
LOGEXTRACT(A_THISHOTKEY)
return


#If (WinActive("Anki"))
tooltip test

loop {
  sleep 1000
  minute := minute + 1
  ; tooltip % minute
}

#If

; ~^l:: 
;   Send, ^l
;    time := end - start
;   return



; :*:measure,.::
;   loop {
;     start := A_TickCount
;     keywait, c
;     end := A_TickCount
;     time := end - start
;     msgbox % time
;   }
; return

; Sleep, 1500
; end := A_TickCount
; end := end - start
; MsgBox, 64, Seconds elapsed, %end%

; Flow
; User starts the script with "measure,." hotkey
  ; 
; Time starts counting up
; Time resets and gets recorded when ctrl+l is pressed and user goes to next topic
; 


; I want to be able to measure the time it takes for the user to go from one topic to the next

; Start script with hotkey
; The script starts counting up
; When hotkey A is pressed, the script resets counting and records the time in a variable called minutes. A counter also counts the amount of times the hotkey A is pressed. THe counter is used to determine the amount of topics the user has gone through. 
; Another counter is used to determine how many extracts a user will go through based how many time hotkey B is pressed
;   - minutes
;   - topics
;   - extract

; extract/(min/topic)

; This value will update everytime hotkey A is pressed.
; The script then starts counting up again
; When the hotkey is pressed again, the script resets and records the time in seconds