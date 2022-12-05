#SingleInstance,Force
#InputLevel 1 ;not a must but required if you also want to trigger a "ctrl + c" hotkey used by another script (such as the screen clipping tool: https://youtu.be/kCmaH9fX3ZA)


; Pseudo-code:


Loop ;read saved data
{
	If FileExist(A_ScriptDir "\clipboard" A_Index) { 
		FileRead, clipboardData%A_Index%, *c %A_ScriptDir%\clipboard%A_Index%
	} else {
		break
	}
}

Hotkey, ^b,Copy,On  ; First iteration of loop as A_index of 1
Hotkey, !c,Paste,On

return

ESC::ExitApp
 
Copy:
Copy(SubStr(A_ThisHotkey,2,1)) ; copy one char from the 8th char of the hotkey string
Msgbox % A_ThisHotkey
return

Paste:
Paste(SubStr(A_ThisHotkey,8,1))
return

Copy(clipboardID) ; clipboardID argument is the A_Index of the hotkey(generated from SubStr(A_ThisHotkey,8,1))
{
global
Clipboard =
Send ^c
ClipWait, 2, 1 ;the 2nd param makes clipwait wait for data of any kind (and not just texts or files)
Tooltip, copied(%clipboardID%)
ClipboardData%clipboardID% := ClipboardAll
FileDelete, %A_ScriptDir%\clipboard%clipboardID% ;not necessary as per the document. FileAppend below always overwrites any existing file in this mode.
FileAppend, %ClipboardAll%, %A_ScriptDir%\clipboard%clipboardID%  ; Backup the clipboard data to a file.
Sleep 1000
Tooltip
}

Paste(clipboardID)
{
OldClipboard := ClipboardAll
Clipboard :=
Clipboard := ClipboardData%clipboardID%
ClipWait, 2, 1
Send ^v
Tooltip, pasted(%clipboardID%)
Clipboard := OldClipboard
Sleep 1000
Tooltip
}