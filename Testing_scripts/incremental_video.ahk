#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

sendToVid(a, b) {
					SetTitleMatchMode, 2
					ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, %b% ;Get the window handle of the Chrome window
					ControlFocus,,ahk_id %outputvar%
					ControlSend, , %a%, %b%
				}

;RShift down hotkeys *combo
	#If (getKeyState("F14", "V") && WinActive("ahk_exe sm18.exe")) 
	; 	;Video Control
					

				f::sendToVid("{space}", "Google Chrome") ; pause
				q::sendToVid("q", "Google Chrome")
				e::sendToVid("e", "Google Chrome")
				g::sendToVid("g", "Google Chrome")
				s::sendToVid("s", "Google Chrome")
				r::sendToVid("r", "Google Chrome")
				w::sendToVid("w", "Google Chrome")
				c::sendToVid("c", "Google Chrome")
				1::sendToVid("1", "Google Chrome")
				2::sendToVid("2", "Google Chrome")
				3::sendToVid("3", "Google Chrome")
				4::sendToVid("4", "Google Chrome")
				5::sendToVid("5", "Google Chrome")
				6::sendToVid("6", "Google Chrome")
				7::sendToVid("7", "Google Chrome")
				8::sendToVid("8", "Google Chrome")
				9::sendToVid("9", "Google Chrome")
				0::sendToVid("0", "Google Chrome")

	#If (getKeyState("F14", "V"))
				f::sendToVid("{space}", "WindowL")
				q::sendToVid("q", "WindowL")
				e::sendToVid("e", "WindowL")
				g::sendToVid("g", "WindowL")
				s::sendToVid("s", "WindowL")
				r::sendToVid("r", "WindowL")
				w::sendToVid("w", "WindowL")
				c::sendToVid("c", "WindowL")
				1::sendToVid("1", "WindowL")
				2::sendToVid("2", "WindowL")
				3::sendToVid("3", "WindowL")
				4::sendToVid("4", "WindowL")
				5::sendToVid("5", "WindowL")
				6::sendToVid("6", "WindowL")
				7::sendToVid("7", "WindowL")
				8::sendToVid("8", "WindowL")
				9::sendToVid("9", "WindowL")
				0::sendToVid("0", "WindowL")

;f13(\) Down Hotkeys *combo
	#If (getKeyState("F13", "V"))
	;for using the original keys replaced by F13
		[:: send \
		]:: send | 

	; Opening video from incremental video
		z::
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
	

		; Copies timestamped URL of vid and transfer to SM
		x::
      clipboard := ""
      Send ^{Home}
      Send {CtrlDown}{ShiftDown}{down 2}{CtrlUp}{ShiftUp}
      Send ^x ; Cut all topic text
      clipwait

      Haystack := clipboard
      ; Copy timestamped URL of video to clipboard
      sendToVid("+{F10}{Tab 3}{Enter}", "Google Chrome") 
      sendToVid("^w", "Google Chrome")
      
      clipboard := RegExReplace(Haystack, "(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])", clipboard) ; Haystack, needle, replacement
      Send ^{Home}
      Send ^v
      Sleep, 200
      Send {Alt}
      Send w
      Send 3    ; This is relative number for changing layout

      return