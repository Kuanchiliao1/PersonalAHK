#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


:*:d,.::do ||{enter}end{Home}{Backspace}{Enter}{Up}{Tab}{Up}{End}{Left} ; Ruby - write blocks 
:*:m,.::{backspace}{home}def {end}{enter}end{Home}{Backspace}{Up}{End}{Sleep 50}{Home}{End} ; Ruby - write method definitions
:*:,.::{enter}end{Home}{Backspace}{Enter}{Up}{Tab}{Up}{End}{Left}{Down} ; Ruby - write blocks 
:*:c,.::{backspace}{home}class {end}{enter}end{Home}{Backspace}{Up}{End}{Sleep 50}{Home}{End} ; Ruby - write method definitions
:*:i,.::def initialize{end}{enter}end{Home}{Backspace}{Up}{End}{Sleep 50}{Home}{End}

:*:template,.:: send
(
>>>>> Problem


input:

output:


>>>>>> Caveats



>>>>>> Examples and test cases



>>>>>> DS + methods, strategies



>>>>>> Algorithm
0.

1.

2.

3.



>>>>>> Code
)
