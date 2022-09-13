SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance force

#Persistent
#InstallKeybdHook
#InstallMouseHook
#Include ..\Private_Folder\KeyLogLib.ahk
#KeyHistory 200

Global VarJ := 3 ; Used for scroll settings
Global VarK := 5
Global VarL := ""

DetectHiddenWindows, On ; BEcause most AHK script have their window hidden
SetTitleMatchMode, 2 

GroupAdd, SuperMemo, ahk_class TBrowser ;Browser
GroupAdd, SuperMemo, ahk_class TContents ;Content Window (Knowledge Tree)
GroupAdd, SuperMemo, ahk_class TElWind ;Element window
GroupAdd, SuperMemo, ahk_class TElDATAWind ;Element Data window
GroupAdd, SuperMemo, ahk_class TSMMain ;Toolbar

    ; these are the lines 1-4 on the menu
        Menu, MyMenu, Add, l, MenuHandler  ;MenuHandler is a label - 
        Menu, MyMenu, Add, F13, MenuHandler
        Menu, MyMenu, Add, F14, MenuHandler
        Menu, MyMenu, Add, Run Chrome, MenuHandler

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
    if (!WinExist("Priorities.ahk")) {
    Run, "..\Private_Folder\Priorities.ahk"
  }
  if (!WinExist("timer.ahk")) {
    Run, "..\Private_Folder\timer.ahk"
  }

sendToVid(a, b) {
          SetTitleMatchMode, 2
          ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, %b% ;Get the window handle of the Chrome window
          ControlFocus,,ahk_id %outputvar%
          ControlSend, , %a%, %b%
        }

return ; End of the Autoexecutable section. Below this would be the functions, hotkeys and everything else.

; Rebinds
    RShift::F14
    \::F13

#If r && getKeyState("Capslock")
  f:: send {Alt Up}


#If r
  d:: send {backspace}
  v:: send {CtrlDown}ku{CtrlUp}
  c:: send {CtrlDown}kc{CtrlUp}
  f::ControlSend, , ruby %clipboard%, Ubuntu
  g:: send ^{enter}
  s:: send {Enter}

  Backspace:: send, you suck
  Enter:: send, you suck
  

  ; #If t && getKeyState("Capslock", "P") ; Sample for using toggle instead of F13
  #If t && getKeyState("F13")
    a:: MouseMove, -50, 0, 1, R
    w:: MouseMove, 0, -50, 1, R
    s:: MouseMove,  0, 50, 1, R
    d:: MouseMove, 50, 0, 1, R

    b:: mouseclick, left


   #If getKeyState("F13")
     r:: 
     t := !t ; For setting toggle
     return
     

     n::
     length := StrLen(clipboard) + 2
      send {+}{- %length%}{+}{enter}
      send {|} %clipboard% {|}{enter}
      send {+}{- %length%}{+}
     return

     m::
     SAT := "Saturday"
      MON := "Monday"
      Saturday := "Saturn"
      Monday := "Moon"
      v := SAT .  MON      ; v = "SaturdayMonday" (there must be a SPACE before and after dot)
      MsgBox v = "%v%"
     return
  #If
;d
;My conventions for anki and SM https://www.wikiwand.com/en/Enclosed_Alphanumeric_Supplement
    conventionclip(abc) { ;Function for conventions
      oldclip := clipboardall ; save clipboard to oldclip variable
      clipboard := "" ; clear clipboard
      clipboard := abc ; 🄲 UNIX {U+1F184}{U+1F17D}{U+1F178}{U+1F187}
      clipwait, 2, 1
      sleep 200
      send ^v
      sleep 200
      clipboard := oldclip
      return  
      }


    :X*:con,.::conventionclip("🄲 ")
    :X*:key,.::conventionclip("⌨ ")
    :X*:ex,.::conventionclip("🅻 ")
    :X*:ahk,.::conventionclip("🄰🅷🅺  ")
    :X*:css,.::conventionclip("🅲🆂🆂 ")
    :X*:js,.::conventionclip("🅹🆂  ")
    :X*:html,.::conventionclip("🅷🆃🅼🅻 ")
    :X*:ruby,.::conventionclip("🆁🆄🅱🆈 ")
    :X*:unix,.::conventionclip("🆄🅽🅸🆇 ")
    :X*:reg,.::conventionclip("🆁🆇")

    :X*:wrong,.::conventionclip("❌💻 ") ; ("{U+274C}{U+1F4BB}") ; 🄲 What's wrong with this code? Red x and computer emoji
    :X*:diff,.::conventionclip("Δ💻 ")    ; ({U+0394}{U+1F4BB})" ; 🄲 What's the difference? Delta and computer emoji
    :X*:gp,.::conventionclip("✍𝒫💻 ") ; ({U+270D}{U+1F4BB})" ; 🄲 Write code for ___ purpose... 
    :X*:p,.::conventionclip("🅿💻 ")  ; 🄲 What does this code do?
    :X*:turn,.::conventionclip("✍🄰→🄱💻 ") ; 🄲 Write code to turn something from A to B
    :X*:op,.::conventionclip("🄾🅿💻 ")  ; 🄲 What does this code do?, what's the output?
    :X*:exp,.::conventionclip("🆇✈️💻 ")


    :X*:rwrong,.::conventionclip("🆁🆄🅱🆈 ❌💻 ")
    :X*:rdiff,.::conventionclip("🆁🆄🅱🆈 Δ💻 ")  
    :X*:rgp,.::conventionclip("🆁🆄🅱🆈 ✍𝒫💻 ")
    :X*:rp,.::conventionclip("🆁🆄🅱🆈 🅿💻 ")
    :X*:rturn,.::conventionclip("🆁🆄🅱🆈 ✍🄰→🄱💻 ")
    :X*:rop,.::conventionclip("🆁🆄🅱🆈 🄾🅿💻 ") 
    :X*:roop,.::conventionclip("🆁🆄🅱🆈 ⭕⭕🅿💻 ")
    :X*:roopexp,.::conventionclip("🆁🆄🅱🆈 🆇 ✈️ ⭕⭕🅿💻 ")
    :X*:rexp,.::conventionclip("🆁🆄🅱🆈 🆇✈️💻 ")

    :*:d,.::do ||{enter}end{Home}{Backspace}{Enter}{Up}{Tab}{Up}{End}{Left} ; Ruby - write blocks 
    :*:m,.::{backspace}{home}def {end}{enter}end{Home}{Backspace}{Up}{End}{Sleep 50}{Home}{End} ; Ruby - write method definitions
    :*:,.::{enter}end{Home}{Backspace}{Enter}{Up}{Tab}{Up}{End}{Left}{Down} ; Ruby - write blocks 
    :*:c,.::{backspace}{home}class {end}{enter}end{Home}{Backspace}{Up}{End}{Sleep 50}{Home}{End} ; Ruby - write method definitions
    :*:i,.::def initialize{end}{enter}end{Home}{Backspace}{Up}{End}{Sleep 50}{Home}{End}
    :*:a,.::assert_equal(
  
;Cursor movement upgrades *combo
  #If (getKeyState("F13") && getKeyState("Capslock", "P"))
    w::
    Send {Up %VarK%}
    SetCapsLockState, alwaysoff
    return
    
    s::
    Send {Down %VarK%}
    SetCapsLockState, alwaysoff
    return

    e::
    Send {Down 5}
    SetCapsLockState, alwaysoff
    return
    
    ;Highlight more lines at a time up and down
      +w:: Send {ShiftDown}{Up 5}{ShiftUp}
      +s:: Send {ShiftDown}{Down 5}{ShiftUp}
      +a:: Send {ShiftDown}{Home}{ShiftUp}
      +d:: Send {ShiftDown}{End}{ShiftUp}

    ;Basic home and end to navigate to front and end of line
      a::
      Send {Home}
      SetCapsLockState, alwaysoff
      Return

      d::
      Send {End}
      SetCapsLockState, alwaysoff
      Return

    ; Guide:
    ; bury  - v ; pause - f ; pass - space ; fail - d ; suspend - s ; delete - a ; reschedule - c ; redo - z ; change deck - x
    ; Red - q ; Orange - w ; Blue - e ; Green - r ; Marked - t ; pink - g ; purple - h
#If (getKeyState("F14") && WinActive("ahk_exe anki.exe") && !WinActive("Add")) ; Active IF I hold down RShift AND anki.exe is active  AND "Add" window is not active | *combo
  ; Anki general navigation keys
    v:: send -
    f:: send p
    d:: send 1
    s:: send ^{Del}
    z:: send z
    c:: send ^+d
    x::send b^d
  
  ;Flags + Marked
    q:: send ^1 
    w:: send ^2
    e:: send ^4
    r:: send ^3
    t:: send +*
    g:: send ^5
    h:: send ^7

;RShift down hotkeys *combo
  #If (getKeyState("F14", "V") && WinActive("ahk_exe sm18.exe")) 
  ; 	;Video Control
          
        f::sendToVid("{Space}", "Google Chrome")
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
      WinMove, A, , 1945, 0, 1500, 1440 
      
      WinActivate ahk_class TElWind
      WinWaitActive ahk_class TElWind
      Sleep, 200 
      Send {Alt}
      Send w
      Send 6    ; This is relative number for changing layout
      Send {Down}
      return
  
  ; Open chrome inconito
    ; y::
    ; 	Run, chrome.exe %clipboard% " --new-window -incognito -always-on-top"
    ; 	WinMove, A, , 1945, 0, 1500, 1440 ; WinMove, Active Window, , x, Y(coordinates for top left of window), window width, window height
    ; 	WinMove, A, , 1945, 0, 1500, 1440 ; WinMove, Active Window, , x, Y(coordinates for top left of window), window width, window height
    ; return#SingleInstance force 

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

  ; Arrow features: Control, Control + Shift, Alt, Windows(left and right)
    ^!w:: send ^!{Up}
    ^!s:: send ^!{Down}
    ^!a:: send ^!{Left}
    ^!d:: send ^!{Right}

    ^d:: send, ^{Right}
    ^a:: send, ^{Left}

    ^+d:: send ^+{Right}
    ^+a::  send ^+{Left}
    ^+w:: send ^+{Up}
    ^+s:: send ^+{Down}

    +!w:: send +!{Up}
    +!s:: send +!{Down}
    +!a:: send +!{Left}
    +!d:: send +!{Right}
    
    +d:: send +{Right}
    +a:: send +{Left}
    +w:: send +{Up}
    +s:: send +{Down}
      
    !a:: send !{Left}
    !d:: send !{Right}
    !w:: send !{Up} 
    !s:: send !{Down}
    
  ; Snap windows left and right, minimize, maximize
    #d:: send, #{Right}
    #a:: Send, #{Left}
    #w:: send {F11}
    #s:: WinMaximize, A
      
  ; Snap windows to diferent monitor
      +#d:: send, #+{Right}
      +#a:: send, #+{Left}
        
  ;VIM-like chrome tab navigation
    +j:: send, ^+{Tab}
    +k:: send, ^{Tab}
      
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
    
  ;Activate/minimize brave windows
    activateMinimize(Title) {
    Ifwinexist %Title%
      {
        IfWinNotActive, %Title%
        WinActivate %Title%
        else
        WinMinimize %Title%
      }
    else
    {
      send {CtrlDown}{CtrlUp}   ; Run C:\Users\kuanc\AppData\Local\Programs\todoist\Todoist.exe 
      sleep 100
      send {CtrlDown}{CtrlUp}
    }
      Return
    }
      g::activateMinimize("WindowG") ; FocusMate window
      h::activateMinimize("WindowH") ; "Home" Window
      u::activateMinimize("ahk_class ConsoleWindowClass ahk_exe ubuntu.exe") ; "Life" Window
      ; k::activateMinimize("WindowK") ; Codin Window
      n::activateMinimize("WindowN") ; Codin Window
      ; l::activateMinimize("WindowL") ; 
        l::
        Menu, MyMenu, Show  ; show the menu created called MyMenu
        send {F13 up}
        return

        MenuHandler:
        If (A_ThisMenuItemPos = 1) {
            activateMinimize("WindowL")
        } else if (A_ThisMenuItemPos = 2) {
            Run, C:\users\juho2\downloads
        } else if (A_ThisMenuItemPos = 3) {
            Run, calc.exe
        } else if (A_ThisMenuItemPos = 4) {
            Run, Chrome.exe
        }
        return


  ;Scroll function
    j::
          Loop %VarJ%
          {
            Click, WheelDown
          }
        return
    k::
          Loop %VarJ%
          {
            Click, WheelUp
          }
        return

  ;Activate/minimize VSCode
    v::
      KeyWait, v
      KeyWait, v, D T0.1 

      If ErrorLevel 
        ; ControlSend, , {left}, ahk_exe vlc.exe 
        activateMinimize("Ubuntu ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe")
      else
        ; ControlSend, , ^{left}, ahk_exe vlc.exe 		
        activateMinimize("hello.ahk ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe")
      return

      

  ;Activate/minimize Todoist
    t::activateMinimize("Todoist")

  ;Notion window activate/minimize
    m::activateMinimize("ahk_class Chrome_WidgetWin_1 ahk_exe Notion.exe")

  ;Clicks
    b:: ; Click center of activate window
        WinGetActiveStats, Title, Width, Height, X, Y
        MouseMove, Width / 2, Height / 2, 0
        Keywait j
        mouseclick, left
        Return
    
    +b:: ; click with highlighting??
        mouseclick, left
        return

  ;simulated arrow keys, perhaps I can turn them into physical presses
    s:: Send {Down}
    w:: Send {Up}
    a:: Send {Left}
    d:: Send {Right}

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
 ; Capslock + 1/2: GUI hotkeys
    setPriority(min, max) {               
      send, !p
      sleep 500
      Random, OutputVar, %min%, %max%
      Clipboard := 
      Clipboard := OutputVar
      Clipwait 2 
      SendInput, {Ctrl down}v{Ctrl up}
      Sleep 200
      Send, {Enter}

      SetCapsLockState, Alwaysoff
      }
      return

    setPriorityExtract(min, max) {
      SendInput, {Shift down}{Alt down}{x}{Shift up}{Alt up}
      Sleep, 800
      Random, OutputVar, %min%, %max%
      Clipboard := ""
      Clipboard := OutputVar
      Clipwait 2 
      SendInput, {Ctrl down}v{Ctrl up}
      Sleep 200
      Send, {Enter}
    
      SetCapsLockState, Alwaysoff
      }
      return

    closeDiscord() {
      run, cmd.exe /c "taskkill /IM "Discord.exe" /F"
      sleep 1000
      
      send {CtrlDown}{CtrlUp}   ; Run C:\Users\kuanc\AppData\Local\Programs\todoist\Todoist.exe 
      sleep 50
      send {CtrlDown}{CtrlUp}
      sleep 50
      ; send discord
      SetCapsLockState, Alwaysoff
      }
      return

      closeAllAHK() {
        run, cmd.exe /c "taskkill /f /im autohotkey.exe"
      SetCapsLockState, Alwaysoff
      }
      return

    runRubyFile() {
      ; WinWaitActive {"ahk_class ConsoleWindowClass ahk_exe ubuntu.exe"}
      ; Sleep 1000
      Send {CtrlDown}kd{CtrlUp}   
      sleep 400
      ControlSend, , ruby %clipboard%, Ubuntu
      ; WinActivate ahk_exe code.exe
      SetCapsLockState, Alwaysoff
      }
      return

    gscroll() {
      ; Inputbox, VarJ, Enter string, , , 640, 480 ; varA = variable, Enter string = GUI header 

      VarJ = 1
      SetCapsLockState, Alwaysoff
      }
      RETURN

    gupdown() {
      Inputbox, VarK, Enter string, , , 640, 480 ; varA = variable, Enter string = GUI header 
      SetCapsLockState, Alwaysoff
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

          case "gscroll":gscroll()
          case "gupdown":gupdown()

          case "ahk": closeAllAHK()

          case 1: closeDiscord()
          case 2: runRubyFile()
          ; case 3: setGlobal()
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
        {
        WinActivate, Code Tester
        Send {#}SingleInstance force {Enter 2}
        }
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
        {
        Send {CtrlDown}kh{CtrlUp}
        SetCapsLockState, alwaysoff
        }

        IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
        {
        Send ^{Enter}
        SetCapsLockState, alwaysoff
        }
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
      
    ; Toggle
      r::
        r := !r
        SetCapsLockState, alwaysoff
        if r 
        {
          tooltip % "Toggle: ON"
          sleep 1000
          tooltip 
        }
        else
        {
          tooltip % "Toggle: OFF"
          sleep 1000
          tooltip 
        }
        return
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
          } else if (KeyPressCount = 3) {
            SetCapsLockState, alwaysoff
            Inputbox, searchTerm, Enter search,,,640, 480
            
            IfWinActive ahk_class Chrome_WidgetWin_1 ahk_exe brave.exe
            {
                      Run, https://www.google.com/search?q=%searchTerm%&sxsrf=ALiCzsYSwIViK8cYWBkyjNn-sOLklBOmfQ:1657397795211&source=lnms&tbm=shop&sa=X&ved=2ahUKEwjl0tb2z-z4AhWupIkEHRJMAcEQ_AUoAXoECAEQAw&biw=1975&bih=1156&dpr=1.1
                      Run, https://www.amazon.com/s?k=%searchTerm%	
                      Run, https://www.ebay.com/sch/i.html?_from=R40&_trksid=m570.l1313&_nkw=%searchTerm%&_sacat=0
                      Run, https://camelcamelcamel.com/search?sq=%searchTerm%
                      Msgbox "Remember to use Cammel!!"		
                      WinWaitClose search	
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
                WinWaitClose search
            }
          }
          
          KeyPressCount := 0 
          SetTimer, KeyPressMonitor, Off
          Tooltip,
          return

    ;Go to line in VSCode
      x:: send ^g
    
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

      ;Three buttons for clipboard - Testing
        ; !+j::
        ; 	clipboard = "" ; empty clipboard
        ; 	sleep 400 ; pause
        ; 	send +#s  ; screenclip
  
        ; 	sleep 3000
        ; 	VarJ := clipboardall
        ; 	msgbox % VarJ
        ; return
        
        ; !+k::
        ; 	clipboard = ""
        ; 	clipboard := VarJ
        ; 	clipwait 

        ; 	sleep 1000
        ; 	send ^v
        ; return

        ; !+l::
        ; 	buttonThree := clipboard
        ; return
          
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
       send %clipboard%
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

:*:template,.::
ClipSaved := ClipboardAll ; save the entire clipboard to the variable ClipSaved
clipboard := ""           ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
clipboard =               ; copy this text:
(
=begin
***Problem***
  - Description: 
  - Input:
    -
  - Output:
    -
  - Questions

***Data Structure***
  - 

***Algorithm***
  - 

=end
)
ClipWait, 2              ; wait max. 2 seconds for the clipboard to contain data. 
if (!ErrorLevel)         ; If NOT ErrorLevel, ClipWait found data on the clipboard
    Send, ^v             ; paste the text
Sleep, 300
clipboard := ClipSaved   ; restore original clipboard
ClipSaved =              ; Free the memory in case the clipboard was very large.
send {up 12}{end}{Space}
return

:*:stage,.::
  SendInput {CtrlDown}{ShiftDown}g{CtrlUp}{ShiftUp}g
  SendInput +{F10}{Sleep 300}{Down 6}
  return 
        
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

    ; SendRaw, {{c1::decreases}}(increases/decreases)
    ; SendRaw, {{c1::increase}}(increase/decrease)
    
  ;Using Right mouse button and scroll wheel
    RButton & WheelDown:: Send ^{PgUp}
    RButton & WheelUp:: Send ^{PgDn}	
    RButton Up:: Click Right

  variable := "World"
  MsgBox Hello %variable%
  MsgBox % "Hello " variable ; The one Angel prefers 

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
    
;Delete windows in taskbar fast
  #If (MouseIsOverClass()="Shell_TrayWnd")
  d::
    Click Right
    Sleep 200
    Send {Up}{Enter}
    return

    MouseIsOverClass() {
    MouseGetPos,,,WinID
    WinGetClass, WinClass, ahk_id %WinID%
    return WinClass
    }
  
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


  #If
; Testing
; Menu, MyMainMenu, Add, AllDeck, MenuHandler
; Menu, MySubMenu1, Add, PSY143, SubMenu1Label
; Menu, MySubMenu1, Add, YT, SubMenu1Label
; Menu, MyMainMenu, Add, AllDeck, :MySubMenu1

; Menu, MyMainMenu, Add, Coding, MenuHandler
; Menu, MySubMenu2, Add, somethinghere, SubMenu2Label
; Menu, MySubMenu2, Add, Coding, :MySubMenu2
; return

; For calendar
+!b::
    mouseclick, left
    sleep 200
    mouseclick, left
    sleep 1500
    send {tab}
    sleep 300
    send Coding - Launch School LS170
    send {Enter}
    sleep 300
    send {Enter} 
  return

; Projects: 

  ; To do:
  
  ; Advanced: scroll through the mouse wheel to change the side buttons(?)
  ; Autosend emails by highlighting email address
  ; Sending the shortcut for the compose feature (c)
  ; Navigate to the "To:" field or image references as last resort

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
; -ip Start with lines 1-500 only... General refactoring and organization - figure out consistent convention for describing the code as well as.... 
; Write down a working BM convention system here: -ip --inprogress, -f --fix, -d --done, -p1 - p2 -p3,  --nav, --find(problem), -x --currently testing
  ; This is in Notion
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
; --done  -p1 Fix Socratic questions script - Maybe make the pause button more accessible. Soln: #!c
; --done Fix F13 + Windows + Shift + Side arrow hotkeys
; --done Figure out the bookmark shortcuts, navigation, and usage
; --done Change the old OCR and test out new one(need to download file from github)
; --done Get suspension working for the following scripts: OCRv2, Priorities, Socratic Questions
; --done -f -p1 Suspension hotkey
; --done Fix Alt + Shift + Arrow + F13 hotkey on VSC
