#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

#Include, JSON.ahk

API_KEY := "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"
url:="https://api.openai.com/v1/completions" ; url pointing to the API endpoint

6::
    clipboardOld := Clipboard
    Clipboard = ""
    Send ^c
    Clipwait
    sleep 200
    prompt := "Write a biblical version of the following text: " . Clipboard
    try{ ; only way to properly protect from an error here
        data:={"model":"text-davinci-003","prompt":prompt,"max_tokens": 400,"temperature": 1234} ; key-val data to be posted
        whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        whr.Open("POST", url, true)
        whr.SetRequestHeader("Content-Type", "Application/json")
        whr.SetRequestHeader("Authorization", "Bearer " . API_KEY)
        whr.Send(StrReplace(JSON.Dump(data), 1234, 0.7))
        ; msgbox % StrReplace(JSON.Dump(data), 1234, 0.7)
        whr.WaitForResponse()
        msgbox % whr.ResponseText

        ; you can get the response data either in raw or text format
        ; raw: hObject.responseBody
        responseText := whr.ResponseText

        responseData := JSON.load(responseText)
        
        response := responseData["choices"][1]["text"]
        sleep 200
        Clipboard := RegexReplace(response, "\n")
        ; Clipboard := response
        msgbox % clipboard
        Tooltip % Clipboard
        sleep 5000
        tooltip
        ; text: hObject.responseText	
    }catch e {
        MsgBox, % e.message
    }
return

; write me the stars



hFont := CreateFont("s35 Italic, Times New Roman")
	SetTimer, OnTimer, -60
	MsgBox, ,My MsgBox, Some text`n`nsome more text                                           `n`n`n`n 
return

OnTimer:
	ControlGet, h, HWND, , Static1, My MsgBox
	SendMessage, 0x30, %hFont%, 1,, ahk_id %h%  ;WM_SETFONT = 0x30 
return

;--------------------------------------------------------------------------
; Function:  CreateFont
;			 Creates font in memory which can be used with any API function accepting font handles.
;
; Parameters: 
;			pFont	- AHK font description, "style, face"
;
; Returns:
;			Font handle
;
; Example:
;>			hFont := CreateFont("s12 italic, Courier New") ; Or CreateFont("s22 bold, Verdana")
;>			SendMessage, 0x30, %hFont%, 1,, ahk_id %hGuiControl%  ;WM_SETFONT = 0x30

CreateFont(pFont="") {

	;parse font 
	italic      := InStr(pFont, "italic")    ?  1    :  0 
	underline   := InStr(pFont, "underline") ?  1    :  0 
	strikeout   := InStr(pFont, "strikeout") ?  1    :  0 
	weight      := InStr(pFont, "bold")      ? 700   : 400 

	;height 
	RegExMatch(pFont, "(?<=[S|s])(\d{1,2})(?=[ ,])", height)
	if (height = "")
	  height := 10
	RegRead, LogPixels, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontDPI, LogPixels
; Sleep, 1000
; MsgBox, %LogPixels% " " %Height%
	height := -DllCall("MulDiv", "int", Height, "int", LogPixels, "int", 72)

	;face 
	RegExMatch(pFont, "(?<=,).+", fontFace)
	if (fontFace != "")
	   fontFace := RegExReplace( fontFace, "(^\s*)|(\s*$)")      ;trim
	else fontFace := "MS Sans Serif"

	;create font
	hFont   := DllCall("CreateFont", "int",  height, "int",  0, "int",  0, "int", 0
					  ,"int",  weight,   "Uint", italic,   "Uint", underline
					  ,"uint", strikeOut, "Uint", nCharSet, "Uint", 0, "Uint", 0, "Uint", 0, "Uint", 0, "str", fontFace)

; Msgbox, %hfont%
	return hFont
}