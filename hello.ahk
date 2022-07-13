#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance force

#Persistent
#InstallKeybdHook
#InstallMouseHook
#Include ..\Private_Folder\KeyLogLib.ahk
#KeyHistory 200

Global VarJ := ""
Global VarK := ""
Global VarL := ""


DetectHiddenWindows, On ; BEcause most AHK script have their window hidden
SetTitleMatchMode, 2 

GroupAdd, SuperMemo, ahk_class TBrowser ;Browser
GroupAdd, SuperMemo, ahk_class TContents ;Content Window (Knowledge Tree)
GroupAdd, SuperMemo, ahk_class TElWind ;Element window
GroupAdd, SuperMemo, ahk_class TElDATAWind ;Element Data window
GroupAdd, SuperMemo, ahk_class TSMMain ;Toolbar


; RUN THESE PROGRAMS ON STARTUP
	
	if (!WinExist("KeyLog (3).ahk")) {
		Run, "..\Private_Folder\KeyLog (3).ahk"
	}
	if (!WinExist("NiftyWindows.ahk")) {
		Run, "..\Private_Folder\NiftyWindows.ahk"
	}
	if (!WinExist("FastNavKeys.ahk")) {
		Run, "..\Private_Folder\FastNavKeys.ahk"
	}
		if (!WinExist("3sec-tooltip-randomised.ahk")) {
		Run, "..\Private_Folder\3sec-tooltip-randomised.ahk"
	}
	if (!WinExist("Anki.ahk")) {
		Run, "..\Private_Folder\Anki.ahk"
	}
	if (!WinExist("something.ahk")) {
		Run, "..\Private_Folder\something.ahk"
	}
	if (!WinExist("OCRv2.ahk")) {
		Run, "..\Private_Folder\OCRv2.ahk"
	}
	if (!WinExist("ScreenBreak.ahk")) {
		Run, "..\Private_Folder\ScreenBreak.ahk"
	}
	if (!WinExist("Socratic_Questions.ahk")) {
		Run, "..\Private_Folder\Socratic_Questions.ahk"
	}
	; if (!WinExist("TestSM2.ahk")) {
	; 	Run, "..\Private_Folder\TestSM2.ahk"
	; }
		if (!WinExist("Priorities.ahk")) {
		Run, "..\Private_Folder\Priorities.ahk"
	}



return ; End of the Autoexecutable section. Below this would be the functions, hotkeys and everything else.

; Run, "..\Private_Folder\testingstuff.txt" ; Sample for how to go out of relative folder 

; Rebinds
	RShift::F14

		; \:: t := !t ; For toggling
	\::F13

;My conventions for anki and SM https://www.wikiwand.com/en/Enclosed_Alphanumeric_Supplement
		; :*:css.::{U+1F172}{U+1F182}{U+1F182} ; 🄲 CSS. This is sample of old version of conventions
	

		conventionclip(abc) { ;Function for conventions
			oldclip := clipboard ; save clipboard to oldclip variable
			clipboard := "" ; clear clipboard
			clipboard := abc ; 🄲 UNIX {U+1F184}{U+1F17D}{U+1F178}{U+1F187}
			clipwait, 2, 1
			sleep 200
			send ^v
			sleep 200
			clipboard := oldclip
			return  
		}

		:X*:con.::conventionclip("🄲 ")
		:X*:key.::conventionclip("⌨ ")
		:X*:ex.::conventionclip("🅻 ")
		:X*:ahk.::conventionclip("🄰🅷🅺  ")
		:X*:css.::conventionclip("🅲🆂🆂 ")
		:X*:js.::conventionclip("🅹🆂  ")
		:X*:html.::conventionclip("🅷🆃🅼🅻 ")
		:X*:ruby.::conventionclip("🆁🆄🅱🆈 ")
		:X*:unix.::conventionclip("🆄🅽🅸🆇 ")

		:X*:wrong.::conventionclip("❌💻 ") ; ("{U+274C}{U+1F4BB}") ; 🄲 What's wrong with this code? Red x and computer emoji
		:X*:diff.::conventionclip("Δ💻 ")    ; ({U+0394}{U+1F4BB})" ; 🄲 What's the difference? Delta and computer emoji
		:X*:gp.::conventionclip("✍𝒫💻 ") ; ({U+270D}{U+1F4BB})" ; 🄲 Write code for ___ purpose... 
		:X*:p.::conventionclip("🅿💻 ")  ; 🄲 What does this code do?
		:X*:turn.::conventionclip("✍🄰→🄱💻 ") ; 🄲 Write code to turn something from A to B
		:X*:op.::conventionclip("🄾🅿💻 ")  ; 🄲 What does this code do?, what's the output?


;Cursor movement upgrades *combo
	#If (getKeyState("F13") && getKeyState("Capslock", "P"))
	; #If t && getKeyState("Capslock", "P") ; Sampling for using toggle instead of F13
		w::
		Send {Up 5}
					SetCapsLockState, alwaysoff

		return

		
		s::
		Send {Down 5}
					SetCapsLockState, alwaysoff

		return

		e::
		Send {Down 5}
					SetCapsLockState, alwaysoff

		return

		;Basic home and end to navigate to front and end of line

			a::
			Send {Home}
			SetCapsLockState, alwaysoff
			Return

			d::
			Send {End}
			SetCapsLockState, alwaysoff
			Return

; f14(Rshift) Down Hotkeys IF Anki is active *combo
		; Guide:
		; bury  - v
		; pause - f
		; pass - space
		; fail - d
		; suspend - s
		; delete - a
		; reschedule - c
		; redo - z
		; change deck - x

		; Red - q
		; Orange - w
		; Blue - e
		; Green - r
		; Marked - t
		; pink - g
		; purple - h
#If (getKeyState("F14") && WinActive("ahk_exe anki.exe") && !WinActive("Add")) ;Active IF I hold down RShift, anki.exe is active, AND "Add" window is not active
	; Anki navigation keys
		v::
		send -
		return

		f::
		send p
		return

		d::
		send 1
		return

		s::
		send ^{Del}
		return

		z::
		send z
		return

		c::
		send ^+d
		return

		x::
		send b
		send ^d
		return


		;Flags + Marked
		q::
		send ^1 
		return

		w::
		send ^2
		return

		e::
		send ^4
		return

		r::
		send ^3
		return

		t::
		send +*
		return

		g::
		send ^5
		return

		h::
		send ^7
		return






#If

;RShift down hotkeys *combo
	#If (getKeyState("F14", "V"))
		;Pseudocode - Create function for controlsend instead of copying it every time
		;I want to keep everything the same except these:

		; ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome ;Get the window handle of the Chrome window
		; ControlFocus,,ahk_id %outputvar%
		; ControlSend, , VAR, Google Chrome


		; Video Controls
				sendToVid(a) {
					SetTitleMatchMode, 2
					ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome ;Get the window handle of the Chrome window
					ControlFocus,,ahk_id %outputvar%
					ControlSend, , %a%, Google Chrome
				}

				f::sendToVid("{space}")
				q::sendToVid("q")
				e::sendToVid("e")
				g::sendToVid("g")
				s::sendToVid("s")
				r::sendToVid("r")
				w::sendToVid("w")
				c::sendToVid("c")
				1::sendToVid("1")
				2::sendToVid("2")
				3::sendToVid("3")
				4::sendToVid("4")
				5::sendToVid("5")
				6::sendToVid("6")
				7::sendToVid("7")
				8::sendToVid("8")
				9::sendToVid("9")
				0::sendToVid("0")

				


				k::
					Loop 3
					{
						Click, WheelUp
					}
					WinGetActiveStats, Title, Width, Height, X, Y
					MouseMove, Width / 2, Height / 2, 0
					mouseclick, left

					return

				j::
					Loop 3
					{
						Click, WheelDown
					}
					WinGetActiveStats, Title, Width, Height, X, Y
					MouseMove, Width / 2, Height / 2, 0
					Keywait, j
					If (KeyWait, F14)
					mouseclick, left
					else
					return

	
	#If



;f13(\) Down Hotkeys *combo
	#If (getKeyState("F13", "V"))

	;for using the original keys replaced by F13
		[::
		send \
		return

		]::
		send | 
		return
		
	; Opening video from incremental video
		z::
			; WinWaitActive  ; Trying to get cursor in the box
			; Click, 300 300
			WinActivate ahk_class TElWind 
			WinWaitActive ahk_class TElWind 
			clipboard := ""
			sleep 100
			Send {CtrlDown}ac{CtrlUp} ; Copy everything to clipboard
			sleep 100
			RegExMatch(clipboard, "(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])", YT_URL) ; Haystack, Needle, Stored in variable YT_URL
			
			If (YT_URL = "") 
			{
				RegExMatch(clipboard, "\[(.{11})\]\.mp4", YT_URL) ; Haystack, Needle, Stored in variable YT_URL
				YT_URL := "https://www.youtube.com/watch?v="YT_URL

				YT_URL := StrReplace(YT_URL, "[", "") ; can replace with RegEx Later
				YT_URL := StrReplace(YT_URL, "]", "")

				YT_URL := StrReplace(YT_URL, ".mp4", "")
				clipboard := ""
				clipboard := YT_URL
				ClipWait
				Send ^{End}
				Send {Enter}
				Send ^v
			}
			
			; Search for URL
			; Verify whether or not it is URL
			; If no URL, then do ___
			
			Run, chrome.exe %YT_URL% " --new-window -incognito -alwaysontop" ; New window, incognito
			sleep, 1000
			WinMove, A, , 1945, 0, 1500, 1440 ; WinMove, Active Window, , x, Y(coordinates for top left of window), window width, window height
			WinMove, A, , 1945, 0, 1500, 1440 ; WinMove, Active Window, , x, Y(coordinates for top left of window), window width, window height
			
			WinActivate ahk_class TElWind 
			WinWaitActive ahk_class TElWind 
			Sleep, 200
			Send {Alt}
			Send w
			Send 6    ; This is relative number for changing layout
			Send {Down}
			return
	; Open chrome inconito
		y::
			Run, chrome.exe %clipboard% " --new-window -incognito -alwaysontop"
			WinMove, A, , 1945, 0, 1500, 1440 ; WinMove, Active Window, , x, Y(coordinates for top left of window), window width, window height
			WinMove, A, , 1945, 0, 1500, 1440 ; WinMove, Active Window, , x, Y(coordinates for top left of window), window width, window height
		return


	;Testing copies timestamped YT url link, ex: https://youtu.be/zd1yXUhqoKM?t=307
		;psuedocode:
		; Cut all topic text
		; Store that clipboard inside a variable
		; Focus other window
		; Retrieve the timestamped URL
		; Refocus Supermemo
		; Use the previous variable as a haystack, needle is the same, replacement is going to be the clipboard
		; Save this as the clipboard
		; Paste the clipboard

		; Copies timestamped URL of vid and transfer to SM
		x::
		clipboard := ""
		Send ^{Home}
		Send {CtrlDown}{ShiftDown}{down 2}{CtrlUp}{ShiftUp}
		Send ^x ; Cut all topic text
		clipwait

		Haystack := clipboard
		; Send {AltDown}{Tab}{AltUp} 
		WinActivate ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe 
		WinWaitActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	
		MouseMove, 300, 300
		sleep 200
		Send {RButton}
		sleep, 200
		send {Tab 3}{Enter}
		winclose ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
		sleep 200
		
		WinActivate ahk_class TElWind 
		WinWaitActive ahk_class TElWind
		
		clipboard := RegExReplace(Haystack, "(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])", clipboard) ; Haystack, needle, replacement
		Send ^{Home}
		Send ^v
		Sleep, 200
		Send {Alt}
		Send w
		Send 3    ; This is relative number for changing layout

		return



	; Arrow features: Control, Control + Shift, Alt, Windows(left and right)

		^!w::
			send ^!{Up}
			return 
		^!s::
			send ^!{Down}
			return

		^!a::
			send ^!{Left}
			return

		^!d::
			send ^!{Right}
			return

		^d::
			send, ^{Right}
			return
		^a::
			send, ^{Left}
			return

		^+d::
			send, ^+{Right}
			return
		^+a:: 
			send, ^+{Left}
			return
		^+w::
			send, ^+{Up}
			return
		^+s::
			send, ^+{Down}
			return

		+!w::
			send, +!{Up}
			return
		+!s::
			send, +!{Down}
			return
		
		+d::
			send, +{Right}
			return
		+a::
			send, +{Left}
			return
		+w::
			send, +{Up}
			return
		+s::
			send, +{Down}
			return

		!a::
			send, !{Left}
			return
		!d::
			send, !{Right}
			return
		!w::
			send, !{Up}
			return
		!s::
			send, !{Down}
			return

		
	; Snap windows left and right, minimize, maximize
		#d::
			send, #{Right}
			Return

		#a::
			Send, #{Left}
			return

		#w::
			send {F11}
			return

		#s::
			WinMaximize, A
			return
			
	; Snap windows to diferent monitor
			+#d::
				send, #+{Right}
				return
			+#a::
				send, #+{Left}
				return

	;VIM-like chrome tab navigation
		+J::
			send, ^+{Tab}
			return
		+K::
			send, ^{Tab}
			return

	

	;Anki window activate/minimize

		o::activateMinimize("User 1 - Anki")
		i::
			IfWinExist Add
			{
				IfWinNotActive, Add
				WinActivate Add
				else
				WinMinimize Add
			}
			else
			{
				WinActivate User 1 - Anki
				WinWaitActive User 1 - Anki
				send a
				WinMinimize User 1 - Anki ;
			}
			Return

		; u::
		; 	IfWinExist Browse
		; 	{
		; 		IfWinNotActive, Browse
		; 		WinActivate Browse
		; 		else
		; 		WinMinimize Browse
		; 	}
		; 	else
		; 	{
		; 		WinActivate User 1 - Anki
		; 		WinWaitActive User 1 - Anki
		; 		send b
		; 		WinMinimize User 1 - Anki ;
		; 	}
		; 	Return
		
	;Activate/minimize brave windows


		activateMinimize(Title) {
			IfWinNotActive, %Title%
			WinActivate %Title%
			else
			WinMinimize %Title%

			
			Return
		}
			g::activateMinimize("WindowG") ; FocusMate window
			h::activateMinimize("WindowH") ; "Home" Window
			u::activateMinimize("ahk_class ConsoleWindowClass ahk_exe ubuntu.exe") ; "Life" Window
			; k::activateMinimize("WindowK") ; Codin Window
			n::activateMinimize("WindowN") ; Codin Window
			l::activateMinimize("WindowL") ; 
			 

	;Scroll function
		j::
					Loop 3
					{
						Click, WheelDown
					}
				return
		k::
					Loop 3
					{
						Click, WheelUp
					}
				return

	;Activate/minimize VSCode
		v::
			SetTitleMatchMode, 2 
			IfWinExist ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe
				{
					IfWinNotActive, ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe
					WinActivate ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe
					else
					WinMinimize ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe
				}
			else
			{
			send {CtrlDown}{CtrlUp}   ; Run C:\Users\kuanc\AppData\Local\Programs\todoist\Todoist.exe 
			sleep 100
			send {CtrlDown}{CtrlUp}
			}
			

			Return
	
	;Activate/minimize Todoist
		t::
			ifwinexist Todoist 
				{
					ifwinnotactive, Todoist
					winactivate, Todoist
					; Sleep 1000
					else
					winminimize, Todoist
				}
			else
			{
			send {CtrlDown}{CtrlUp}   ; Run C:\Users\kuanc\AppData\Local\Programs\todoist\Todoist.exe 
			sleep 100
			send {CtrlDown}{CtrlUp}
			}
			Return

	;Notion window activate/minimize
		m::
			ifwinexist ahk_class Chrome_WidgetWin_1 ahk_exe Notion.exe 
				{
					ifwinnotactive, ahk_class Chrome_WidgetWin_1 ahk_exe Notion.exe ; Checks if the window is active
					winactivate, ahk_class Chrome_WidgetWin_1 ahk_exe Notion.exe ; Activates the window
					; Sleep 1000
					else
					winminimize, ahk_class Chrome_WidgetWin_1 ahk_exe Notion.exe ; Minimizes the window
				}
			else
			{
			send {CtrlDown}{CtrlUp}   ; Run C:\Users\kuanc\AppData\Local\Programs\todoist\Todoist.exe 
			sleep 100
			send {CtrlDown}{CtrlUp}
			}
			Return

	;Click center of active window
		b::
					WinGetActiveStats, Title, Width, Height, X, Y
					MouseMove, Width / 2, Height / 2, 0
					Keywait j
					mouseclick, left
					Return

	;simulated arrow keys, perhaps I can turn them into physical presses
		s::
		Send {Down}
		Return

		w::
		Send {Up}
		Return

		a::
		Send {Left}
		Return
		
		d::
		Send {Right}
		Return

	;change SM template hotkeys
		p::
			ifwinexist ahk_exe sm18.exe
			{
		WinActivate ahk_exe sm18.exe ahk_class TElWind
		send, ^+m
		Text := "Article Picture"
		Send, %Text%
		send, {Enter}
		}
		return

		q::
			ifwinexist ahk_exe sm18.exe

			{
			WinActivate ahk_exe sm18.exe ahk_class TElWind 
			send, ^+m
			Textp := "Article"
			Send, %Textp%
			send, {Enter}
			}
			return

	#If

;Capslock Down Hotkeys *combo
		#If (getKeyState("Capslock", "P"))


	p::
		PID:=DllCall("GetCurrentProcessId") 
for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process where name = 'Autohotkey.exe' and processID  <> " PID )
   process, close, % process.ProcessId
process, close, % PID ; If you want to close also this script
return




		setPriority(min, max) {               

    send, !p
		sleep 1000
    Random, OutputVar, %min%, %max%
    Clipboard := 
		Clipboard := OutputVar
		Clipwait 2 
		Send, ^v
		Sleep 200
		Send, {Enter}

    SetCapsLockState, Off
		}
		return

		setPriorityExtract(min, max) {
   
    Send, +!{x}
		Sleep, 1000
   
    Random, OutputVar, %min%, %max%
		Clipboard := ""
		Clipboard := OutputVar
		Clipwait 2 
		Send, ^v
		Sleep 200
		Send, {Enter}
   
    SetCapsLockState, Off
		}
		return

		;Open GUI (Capslock + 1)
			1::
			Inputbox, varA, Enter string, , , 640, 480 ; varA = variable, Enter string = GUI header 
			
			switch varA
			{
				case "q": setPriority(0.01,0.36)
				case "w": setPriority(0.36,0.72)
				case "e": setPriority(0.72,1.08)
				case "r": setPriority(1.08,1.44)
				case "t": setPriority(1.44,1.8)
				case "y": setPriority(1.8,2.16)
				case "u": setPriority(2.16,2.52)
				case "i": setPriority(2.52,2.88)
				case "o": setPriority(2.88,3.24)
				case "p": setPriority(3.24,3.6)

				case "a": setPriority(3.6,6.04)
				case "s": setPriority(6.04,8.48)
				case "d": setPriority(8.48,10.92)
				case "f": setPriority(10.92,13.36)
				case "g": setPriority(13.36,15.8)
				case "h": setPriority(15.8,18.24)
				case "j": setPriority(18.24,20.68)
				case "k": setPriority(20.68,23.12)
				case "l": setPriority(23.12,25.56)
				case ";": setPriority(25.56,28.0)

				case "z": setPriority(28,33)
				case "x": setPriority(33,38)
				case "c": setPriority(38,45)
				case "v": setPriority(45,55)
				case "b": setPriority(55,66)
				case "n": setPriority(66,77)
				case "m": setPriority(77,88)
				case ",": setPriority(88,95)
				case ".": setPriority(95,99)
;::setPriorityExtract(99,99.9)
			}
			return



		; Open GUI 
				2::
					Inputbox, varB, Enter string, , , 640, 480 ; varB = variable, Enter string = GUI header
				

				switch varB
				{ 
					case "q": setPriorityExtract(0.01,0.36)
					case "w": setPriorityExtract(0.36,0.72)
					case "e": setPriorityExtract(0.72,1.08)
					case "r": setPriorityExtract(1.08,1.44)
					case "t": setPriorityExtract(1.44,1.8)
					case "y": setPriorityExtract(1.8,2.16)
					case "u": setPriorityExtract(2.16,2.52)
					case "i": setPriorityExtract(2.52,2.88)
					case "o": setPriorityExtract(2.88,3.24)
					case "p": setPriorityExtract(3.24,3.6)

					case "a": setPriorityExtract(3.6,6.04)
					case "s": setPriorityExtract(6.04,8.48)
					case "d": setPriorityExtract(8.48,10.92)
					case "f": setPriorityExtract(10.92,13.36)
					case "g": setPriorityExtract(13.36,15.8)
					case "h": setPriorityExtract(15.8,18.24)
					case "j": setPriorityExtract(18.24,20.68)
					case "k": setPriorityExtract(20.68,23.12)
					case "l": setPriorityExtract(23.12,25.56)
					case ";": setPriorityExtract(25.56,28.0)

					case "z": setPriorityExtract(28,33)
					case "x": setPriorityExtract(33,38)
					case "c": setPriorityExtract(38,45)
					case "v": setPriorityExtract(45,55)
					case "b": setPriorityExtract(55,66)
					case "n": setPriorityExtract(66,77)
					case "m": setPriorityExtract(77,88)
					case ",": setPriorityExtract(88,95)
					case ".": setPriorityExtract(95,99)
				}
				return



		;Alternative Esc Key
			q::
			Send, {Esc}
			SetCapsLockState, alwaysoff
			return 
		;Insert date and time for Anki cards
			t::
			Send {Enter 2}{Up 2}

			FormatTime, TimeString, R
			clipboard := TimeString
			Send ^v
			Sleep, 200
			Send {Enter}
			SetCapsLockState, alwaysoff
			return

	
		;Volume Up, Volume Down
			4::
			Send {Volume_Up 3}
			SetCapsLockState, alwaysoff
			return

			3::
			Send {Volume_Down 3}
			SetCapsLockState, alwaysoff
			return

		;Open Codetester
			y::
			IfWinNotExist, Code Tester
			Run, %A_ScriptDir%\Codetest.ahk

			IfWinNotActive, Code Tester
			WinActivate, Code Tester
			else
			WinMinimize, Code Tester

			SetCapsLockState, alwaysoff
			return


		;Delete, minimize window
			w::
			Send !{F4}
			SetCapsLockState, alwaysoff
			return

			s::
			WinMinimize, A
			SetCapsLockState, alwaysoff
			return

		;Win Escape to inactivate Nifty Window
			f::
			; PostMessage, 0x0111, 65303,,, OCRv2.ahk - AutoHotkey  ; Reload.
			; PostMessage, 0x0111, 65303,,, Priorities.ahk - AutoHotkey  ; Reload.
			; PostMessage, 0x0111, 65303,,, Socratic_Questions.ahk - AutoHotkey  ; Reload.
			; PostMessage, 0x0111, 65303,,, NiftyWindows.ahk - AutoHotkey  ; Reload.
			
			PostMessage, 0x0111, 65305,,, OCRv2.ahk - AutoHotkey  ; Suspend.
			PostMessage, 0x0111, 65305,,, Priorities.ahk - AutoHotkey  ; Suspend.
			PostMessage, 0x0111, 65305,,, Socratic_Questions.ahk - AutoHotkey  ; Suspend.
			PostMessage, 0x0111, 65305,,, NiftyWindows.ahk - AutoHotkey  ; Suspend.
			; WinClose ScriptFileName.ahk - AutoHotkey			
			SetCapsLockState, alwaysoff

			return

		;Go to the top/bottom of a page
			^d::
			Send {Ctrl Down}{End}{Ctrl Up}
			SetCapsLockState, alwaysoff
			Return
			
			^a::
			Send {Ctrl Down}{Home}{Ctrl Up}
			SetCapsLockState, alwaysoff
			Return

		;Highlight rest of line to the right/left of the cursor
			+a::
			Send {Shift Down}{Home}{Shift Up}
			SetCapsLockState, alwaysoff
			Return

			+d::
			Send {Shift Down}{End}{Shift Up}
			SetCapsLockState, alwaysoff
			Return


	
		;Highlight the entire page to the right/left of the cursor
			^+a::
			Send {Ctrl Down} {Shift Down}{Home}{Shift Up}{Ctrl Up}
			SetCapsLockState, alwaysoff
			Return

			^+d::
			Send {Ctrl Down} {Shift Down}{End}{Shift Up}{Ctrl Up}
			SetCapsLockState, alwaysoff
			Return


		;Run AHK script
			z::
			IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe
			Send {CtrlDown}kh{CtrlUp}
			
			SetCapsLockState, alwaysoff
			Return

		;Windows Spy
			c::
				IfWinNotExist, Window Spy
				run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\Window Spy.lnk

				IfWinNotActive, Window Spy
				WinActivate, Window Spy
				else
				WinMinimize, Window Spy

				SetCapsLockState, alwaysoff

			Return
				
		;Steven
			k::
			Run chrome.exe https://www.youtube.com/watch?v=GDTD24KsdGc "--new-window -incognito"
			return
	
		;Instant google search    
			e::
				If (KeyPressCount > 0) {
					KeyPressCount += 1
				} else {
					KeyPressCount := 1
				}

				Tooltip, % KeyPressCount

				SetTimer, KeyPressMonitor, 300 ;Run KeyPressMonitor after 300ms
				return


				KeyPressMonitor:
				If (KeyPressCount = 1) {
					IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe brave.exe 
					{clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
					Send ^c
					ClipWait  
					
					Run, https://www.google.com/search?q=%ClipBoard%
					SetCapsLockState, alwaysoff
					
					}
					else
					{clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
					Send ^c
					ClipWait  

					WinActivate Main1

					Run, https://www.google.com/search?q=%ClipBoard%
								SetCapsLockState, alwaysoff
								}
				} else if (KeyPressCount = 2) {
					IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe brave.exe
					
					{clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
					Send ^c
					ClipWait  ; Wait for the clipboard to contain text.
					
					
					Sleep 500
					Send ^t
					Send, ^v
					Send {Enter}
							SetCapsLockState, alwaysoff
							
					}


					else
					{clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
					Send ^c
					ClipWait  ; Wait for the clipboard to contain text.
					WinActivate WindowH
					
					Sleep 500
					Send ^t
					Send, ^v
					Send {Enter}
							SetCapsLockState, alwaysoff
							}
				} else if (KeyPressCount > 2) {
					SetCapsLockState, alwaysoff
					Inputbox, searchTerm, Enter search,,,640, 480
					
					IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe brave.exe
					{
										Run, https://www.google.com/search?q=%searchTerm%&sxsrf=ALiCzsYSwIViK8cYWBkyjNn-sOLklBOmfQ:1657397795211&source=lnms&tbm=shop&sa=X&ved=2ahUKEwjl0tb2z-z4AhWupIkEHRJMAcEQ_AUoAXoECAEQAw&biw=1975&bih=1156&dpr=1.1
										Run, https://www.amazon.com/s?k=%searchTerm%	
										Run, https://www.ebay.com/sch/i.html?_from=R40&_trksid=m570.l1313&_nkw=%searchTerm%&_sacat=0
										Run, https://camelcamelcamel.com/search?sq=%searchTerm%
										Msgbox "Remember to use Cammel!!"			
					}

					else
					{
					WinActivate WindowH
						Run, https://www.google.com/search?q=%searchTerm%&sxsrf=ALiCzsYSwIViK8cYWBkyjNn-sOLklBOmfQ:1657397795211&source=lnms&tbm=shop&sa=X&ved=2ahUKEwjl0tb2z-z4AhWupIkEHRJMAcEQ_AUoAXoECAEQAw&biw=1975&bih=1156&dpr=1.1
						Run, https://www.amazon.com/s?k=%searchTerm%	
						Run, https://www.ebay.com/sch/i.html?_from=R40&_trksid=m570.l1313&_nkw=%searchTerm%&_sacat=0
						Run, https://camelcamelcamel.com/search?sq=%searchTerm%

						Msgbox "Remember to use Cammel!!"	
							SetCapsLockState, alwaysoff
							}
				}
				KeyPressCount := 0 
				SetTimer, KeyPressMonitor, Off
				Tooltip,
				return


;*SAMPLE for multiple taps on same key hotkeys
; u::
; If (KeyPressCount > 0) {
; 	KeyPressCount += 1
; } else {
; 	KeyPressCount := 1
; }

; Tooltip, % KeyPressCount

; SetTimer, KeyPressMonitor, 300 ;Run KeyPressMonitor after 300ms
; return


; KeyPressMonitor:
; If (KeyPressCount = 1) {
; 	msgbox Single Press
; } else if (KeyPressCount = 2) {
; 	msgbox Double Press
; } else if (KeyPressCount > 2) {
; 	msgbox Triple Press
; }
; KeyPressCount := 0 
; SetTimer, KeyPressMonitor, Off
; Tooltip,
; return

		;Go to line in VSCode
			x::
				send ^g
				return		
		
		;cut highlighted text and wrap it with console.log
			b::
				OldClip := Clipboard
				Clipboard := ""
				Send ^x
				Clipwait
				Clipboard := "console.log('%c" Clipboard "', 'font-size:50px;color:red;text-shadow: 2px 3px white')"
				return
		
		;Go to next focusmate session
			g::
				WinActivate FocusMate Window
				WinWaitActive FocusMate Window
				Send ^w
				Run, https://www.focusmate.com/
				MsgBox, 4096,, Continue after page loads!
				Send f
				Sleep 500
				Send jc
				return

#If

; ------DONE REFACTOR HERE

;General make life easier stuff 
	;Browser Hotkeyss
		;Manipulating Windows(2)
			;Close/minimize(!+w,s,d)
				!+w::
				CUSTOMLOGGER(A_THISHOTKEY)
				Send, !{F4}
				return

				; !+s::
				; CUSTOMLOGGER(A_THISHOTKEY)
				; WinMinimize, A
				; return

				!+d::WinMaximize, A


			;Three buttons for clipboard
			
			
				!+j::
					clipboard = "" ; empty clipboard
					sleep 400 ; pause
					send +#s  ; screenclip
	
					sleep 3000
					VarJ := clipboardall
					msgbox % VarJ
				return
				
				
				!+k::
					clipboard = ""
					clipboard := VarJ
					clipwait 

					sleep 1000
					send ^v
				return


				!+l::
					buttonThree := clipboard
				return

					
			;Tag and recall windows(!+q !+e)
				!+q::
				CUSTOMLOGGER(A_THISHOTKEY)
				WinTag := WinActive("A")
				Return


				!+e::
				CUSTOMLOGGER(A_THISHOTKEY)
				WinActivate, ahk_id %WinTag%
				Return	


	;Pasting slides to Docs From Specific Screen Region, use w/ ShareX(+#^q)
		+#^q::
		Send, #+{q}
		Sleep, 1000
		Send, {Enter 9}
		Send, ^{v}
		Sleep, 2000
		Send, {Enter}
		Return

	
	;Autocorrects/text expansions
		:*?:.test::
		send %ClipBoard%
		return

		:*?:kmail::kuanchiliao@gmail.com
    :*:cmail::clickthisbabyonemoretime@gmail.com
		:*?:ucmail::kuanchiliao@ucsb.edu
		::resumee::résumé
		::Resumee::Résumé	
		:*?:meetk::calendly.com/sj1
		:*?:meetz::https://meet.jit.si/
		:*?:+-::± ; plus or minus sign
		:*:Tnow::- set alarm for 

		;For coding
			:r:#sin::#singleinstance force


		;For sending dates and time
			:c*:Anow::
			SendInput, %A_MM%-%A_DD%-%A_YYYY%
			Return

			:c*:Bnow::
			SendInput, %A_DD%-%A_MM%-%A_YYYY% %A_Hour%:%A_Min% ; press CTRL+d
			Return

			:c*:Cnow::
			Clipboard := ""
			FormatTime, TimeString, R
			Clipboard := TimeString
			Clipwait
			Send ^v
			Sleep, 200
			Send {Enter}
			Return

		;Spanish accents
		:*?:aaa::á
		:*?:uuu::ú
		:*?:eee::é
		:*?:iii::í
		:*?:ooo::ó
		:*?:!!!::¡
		:*?:???::¿
		:*?:nnnn::ñ
		
		;Arrows
		:*:>>.::→
		:*:<<.::←
		:*:^^.::↑
		:*:vv.::↓
		

		; :*:increases*
		; SendRaw, {{c1::increases}}(↑↓ )

		; "A" protein is 10,000x bigger(better? greater? more numerous?) than "B" protein
		; (related to size) protein "A" is [...] than "B" 


		; Return
		; :*:decreases*
		; SendRaw, {{c1::decreases}}(increases/decreases)
		; Return
		; :*:increase*
		; SendRaw, {{c1::increase}}(increase/decrease)
		; Return
		; :*:decrease*
		; SendRaw, 
		; Return
		

	;Using Right mouse button and scroll wheel
		RButton & WheelDown:: Send ^{PgUp}
		RButton & WheelUp:: Send ^{PgDn}	
		RButton Up:: Click Right





	variable := "World"
	MsgBox Hello %variable%
	MsgBox % "Hello " variable ; The one Angel prefers lol

	;For DeepL
		; ::
		; CUSTOMLOGGER(A_THISHOTKEY)
		
		; clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
		; Send ^c
		; ClipWait  ; Wait for the clipboard to contain text.
		; Sleep, 200
		; WinActivate, ahk_class HwndWrapper[DeepL.exe;;198b3523-c50d-4a8a-9b13-9710a5a981e7]

		; Send, {Enter 2} %Clipboard%

		; ; if (InStr(ClipBoard, "http")) {
		; ; if RegExMatch(ClipBoard, "^http") { ; "^" means it is on the start of the string
		; ; 	Run, % ClipBoard
		; ; }
		; ; else {
		; ; 	Run, https://www.google.com/search?q=%ClipBoard%
		; ; 	Run, https://duckduckgo.com/?q=%ClipBoard%&t=hd&va=u&ia=web
		; ; }

		; Return
		
		; ::
		; CUSTOMLOGGER(A_THISHOTKEY)
		
		; clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
		; Send ^c
		; ClipWait  ; Wait for the clipboard to contain text.	
		; Run, https://www.spanishdict.com/translate/%ClipBoard%
		; Return




	;Instasearch YT
		^#y::
		CUSTOMLOGGER(A_THISHOTKEY)   ;This stopped working no idea why?
		Send, ^c
		ClipWait,
		Sleep 200
		Run, https://www.youtube.com/results?search_query=%ClipBoard%
		Return
	
	;Search AHK documentation
		; ::
		; CUSTOMLOGGER(A_THISHOTKEY)
		; Send, ^c
		; ClipWait,
		; Run, https://www.autohotkey.com/docs/Tutorial.htm#s83
		; Sleep, 1500
		; Send, {Alt down}s{Alt up}
		; Send, %ClipBoard% 
		; Send, {Enter}
		; Return


;Paste clean text
	^#v::
		CUSTOMLOGGER(A_THISHOTKEY) ;Control G =Paste Text version of Clipboard
		Clipboard_Backup := ClipboardAll ;Store full version of clipboard
		ClipBoard := ClipBoard ; Convert clipboard to plain text
		SendEvent, ^v ;Send paste
		sleep, 100 ;Always have a sleep after pasting and before restoring clipboard
		Clipboard:=Clipboard_Backup
		Return
	
;All Anki shortcuts(2 - put in If statements here)
	
	;Snip and do image occlusal(Ctrl Win S)
	
		^#s::
		CUSTOMLOGGER(A_THISHOTKEY)
		Clipboard := "" ; Empty the clipboard
		
		Send, #+s
		
		;Send, ^c

		ClipWait, 5 ; "2" seconds

		WinActivate, ahk_class Qt5QWindowIcon
		;Send, a
		Sleep, 500
		Send, {Shift down}{Control down}{o}{Shift up}{Control up}
		WinActivate, ahk_class 
		Send, f
		Sleep, 2000
		Send, {LButton}
		Sleep, 500
		Send, {f}r
		return
		
	
	#IfWinActive ahk_class Qt5QWindowIcon
	;Cloze hotkey
		
		RWin::^j

	;Enter tag on Anki
		:*:tagsp::
			CUSTOMLOGGER(A_THISHOTKEY)
			Send, {Ctrl Down}{Shift Down}t{Ctrl Up}{Shift Up}
			Sleep, 200
			Send, SpanishPriority
			Sleep, 200
			Send, {Shift Down}{Tab}{Shift Up}
			Sleep, 100
			Send, {Shift Down}{Tab}{Shift Up}
			Sleep, 100
			Send, {Shift Down}{Tab}{Shift Up}

			Return
		
		:*:tagred::
			CUSTOMLOGGER(A_THISHOTKEY)
			Send, {Ctrl Down}{Shift Down}t{Ctrl Up}{Shift Up}
			Sleep, 200
			Send, Reddit
			Sleep, 200
			Send, {Shift Down}{Tab}{Shift Up}
			Sleep, 100
			Send, {Shift Down}{Tab}{Shift Up}
			Sleep, 100
			Send, {Shift Down}{Tab}{Shift Up}
			Return
		
		:*:tagrela::
			CUSTOMLOGGER(A_THISHOTKEY)
			Send, {Ctrl Down}{Shift Down}t{Ctrl Up}{Shift Up}
			Sleep, 200
			Send, Psy149
			Sleep, 200
			Send, {Shift Down}{Tab}{Shift Up}
			Sleep, 100
			Send, {Shift Down}{Tab}{Shift Up}
			Sleep, 100
			Send, {Shift Down}{Tab}{Shift Up}

			Return
		
		; :*:tagsp:
		; 	Send, {Ctrl Down}{Shift Down}t{Ctrl Up}{Shift Up}
		; 	Sleep, 200
		; 	Send, SpanishPriority
		; 	Sleep, 200
		; 	Send, {Shift Down}{Tab}{Shift Up}
		; 	Sleep, 100
		; 	Send, {Shift Down}{Tab}{Shift Up}
		; 	Sleep, 100
		; 	Send, {Shift Down}{Tab}{Shift Up}

		; 	Return
		
		; :*:tagsp:
		; 	Send, {Ctrl Down}{Shift Down}t{Ctrl Up}{Shift Up}
		; 	Sleep, 200
		; 	Send, SpanishPriority
		; 	Sleep, 200
		; 	Send, {Shift Down}{Tab}{Shift Up}
		; 	Sleep, 100
		; 	Send, {Shift Down}{Tab}{Shift Up}
		; 	Sleep, 100
		; 	Send, {Shift Down}{Tab}{Shift Up}

		; 	Return


		
;Delete windows in taskbar fast
	#If (MouseIsOverClass()="Shell_TrayWnd")
	d::
	Click Right
	Sleep 200
	Send {Up}{Enter}
	return

	MouseIsOverClass(){
	MouseGetPos,,,WinID
	WinGetClass, WinClass, ahk_id %WinID%
	return WinClass
	}
	#If
	
#IfWinActive ahk_exe sm18.exe ; if one of these windows are active, execute. This is more robust
	~^m::
		mouseclick, left
		sleep 200
		send ^m
		return

		
	;Deleted first component from the article import template
		F2::
		{
			Send, ^{Del}
			WinWaitActive,  Question ahk_class TMsgDialog, , 5 ;Delete HTML component
			;WinWaitActive,  Choices ahk_class TChoicesDlg ;What do you want to change ; Modify only this &element / Modify &all elements using this template
			;MsgBox waited
			clipboard =
			send, !p ;copy dialog text to clipboard
			Haystack := clipboard
			;MsgBox %Haystack%
			Needle := "Delete HTML component"
			If InStr(Haystack, Needle) {
				send, {Enter} ; confirm deletion dialog
				WinWaitActive, Choices ahk_class TChoicesDlg ; What do you want to change?
				sleep, 50
				send, {Enter} ; confirm dialog What do you want to change?
				
			} else {
				MsgBox Element deletion has been prevented
				sleep, 10
				Send, {Esc} ; close dialog
			}

		}
		return

	;Conventions SM 
	;Quick End of Queue(inactive)
		;^s:
		;Send, ^+{j}
		;Send, {Enter}
		;Sleep, 50
		;return


	;Make cloze and delete-
		^!z::
		Sleep, 100
		Send, !{z}
		Sleep, 2000
		Send, {Ctrl down}d{Ctrl Up}{Enter 2}
		return

	;Make extract
		^!x::
		CUSTOMLOGGER(A_THISHOTKEY)
		Sleep, 100
		Send, !{x}
		Sleep, 2000
		Send, !{Left}
		return



	;Quick Delete(Del) 
		Delete::
		CUSTOMLOGGER(A_THISHOTKEY)
		Send, {Delete}
		Send, {Enter}
		return

	;Quick Dismiss(Cntrl D) 

		~^d::
		CUSTOMLOGGER(A_THISHOTKEY)
		Send, ^{d}
		Send, {Enter}
		Send, {Enter}
		Send, {Enter}
		return

	



; Projects: 

	; To do:
	
	
	
	; Advanced: scroll through the mouse wheel to change the side buttons(?)
	; Autosend emails by highlighting email address
	; Sending the shortcut for the compose feature (c)
	; Navigate to the "To:" field or image references as last resort


	; Wrap in quotes for google searches > can do by myself



;Add task on todoist
	^#d::
		CUSTOMLOGGER(A_THISHOTKEY)
		Send, {Ctrl down}l{Ctrl up}
		Sleep, 300
		Send, {Ctrl down}c{Ctrl up}
		Sleep, 300
		Send, {Ctrl down}w{Ctrl up}
		Sleep, 300
	
	Run, C:\Users\kuanc\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Todoist.lnk


	Return



;Language learning(DEEPL)





; #if (getKeyState("LButton", "P"))
; s::
; 	WinGet, active_id, ID, A
; 	Click
; 	Sleep, 20
; 	WinGet, temp_id, ID, A ; store the ID in variable
; 	WinMinimize, ahk_id %temp_id%
; 	if (temp_id !== active_id){
; 		WinActivate, ahk_id %active_id%
; 	}
; 	return

; d::
; Click
; Send !{F4}
; return

; #if

#If
; Work in progress
Menu, MyMainMenu, Add, AllDeck, MenuHandler
Menu, MySubMenu1, Add, PSY143, SubMenu1Label
Menu, MySubMenu1, Add, YT, SubMenu1Label
Menu, MyMainMenu, Add, AllDeck, :MySubMenu1

Menu, MyMainMenu, Add, Coding, MenuHandler
Menu, MySubMenu2, Add, somethinghere, SubMenu2Label
Menu, MySubMenu2, Add, Coding, :MySubMenu2

return

^+h::
Menu, MyMainMenu, Show
return


MenuHandler:  ; I don't want it to do anything if I'm hovering/clicking a main menu item with a submenu
return 

SubMenu1Label:
If (A_ThisMenuItemPos = 1) {
	Run, %A_desktop%
} else if (A_ThisMenuItemPos = 2) {
	send test
}
return



SubMenu2Label:
If (A_ThisMenuItemPos = 1) {
	send test 
} else if (A_ThisMenuItemPos = 2) {

}




+!b::
mouseclick, left
sleep 200
mouseclick, left
sleep 1500
send {tab}
sleep 300
send Coding - Launch School RUBY101
send {Enter}
sleep 300
send {Enter} 


;Guide


; Shift + Alt + Arrow: copy line up or down
; Move lines: alt + arrow 
; Hold alt: highlight multiple things
; Make comment: Cntrl > K > C             
; Uncomment: Cntrl > K > U
; Alt: Set multiple cursors
;     Note: can use to duplicate multiple lines at same time

; Fold (Ctrl+Shift+[) folds the innermost uncollapsed region at the cursor.
; Unfold (Ctrl+Shift+]) unfolds the collapsed region at the cursor.
; Toggle Fold (Ctrl+K Ctrl+L) folds or unfolds the region at the cursor.
; Fold Recursively (Ctrl+K Ctrl+[) folds the innermost uncollapsed region at the cursor and all regions inside that region.
; Unfold Recursively (Ctrl+K Ctrl+]) unfolds the region at the cursor and all regions inside that region.
; Fold All (Ctrl+K Ctrl+0) folds all regions in the editor.
; Unfold All (Ctrl+K Ctrl+J) unfolds all regions in the editor.
; Fold Level X (Ctrl+K Ctrl+2 for level 2) folds all regions of level X, except the region at the current cursor position.
; Fold All Block Comments (Ctrl+K Ctrl+/) folds all regions that start with a block comment token.
;Split editor: Control + \
;Expland selection: Shift + Alt + Arrows
;Select occurances of word: Control F2
;Insert line above: Enter
;Look up shortcuts: Control K + S
;Go to line: Control G
;Look up hotkey functions(Control Shift P)
;Split window? (Control)





; Tasklist:
; -p3 find Cut the fat from startup scripts
; -ip Start with lines 1-500 only... General refactoring and organization - figure out consistent convention for describing the code as well as.... 
; Write down a working BM convention system here: -ip --inprogress, -f --fix, -d --done, -p1 - p2 -p3,  --nav, --find(problem), -x --currently testing
; Put all code I'm not using into an archive script
; -p1 Get this code on to github while properly using git ignore
; --done -p1 Make a hotkey to click in the vertical center of the text editor so I can focus after scroll with F14 + j/k
; GUI menu for deck, and submenu for tag ALSO GUI menu for 
	; Hotkey: Capslock H
	; Making the GUI activation hotkeys: Capslock 1, 4
	; First menu of decks I frequent: All, All Generative, Coding
	; Sub menu of tags: LS, 
; Find Vimston's way to scroll in SM
; --done Use regular suspend instead of entire NiftyWindows Script

; Setup an alphabetic table that updates automatically so that I know which hotkeys are open and which are not - currently have excel version
; Done manually with:
; Capslock down only
; To do: F13, F14
; Find out all the combos by scrolling through my script
; F13 down: Control, Capslock, Shift. Control + Shift, Control + Capslock, Shift + Capslock 
; F14: Control, Capslock, Shift. Control + Shift, Control + Capslock, Shift + Capslock  Make these into submenus, perhaps with an INI file?? I'm not sure. Maybe just a list with spaces
; Control
; Control + Shift
; Control + Win
; Control + Alt
; Win + Alt




; --done  -p1 Fix Socratic questions script - Maybe make the pause button more accessible. Soln: #!c
; --done Fix F13 + Windows + Shift + Side arrow hotkeys
; --done Figure out the bookmark shortcuts, navigation, and usage
; --done Change the old OCR and test out new one(need to download file from github)
; --done Get suspension working for the following scripts: OCRv2, Priorities, Socratic Questions
; --done -f -p1 Suspension hotkey
; --done Fix Alt + Shift + Arrow + F13 hotkey on VSC








 
