#Requires AutoHotkey v1.0
#NoEnv
SendMode Input
#SingleInstance Force
#MaxThreadsPerHotkey 2

toggle := false
dauntlessExe := "ahk_exe Dauntless-Win64-Shipping.exe"
soundFilePath1 := "C:\Users\User\Documents\Dauntless\Macro\ding.wav"
soundFilePath2 := "C:\Users\User\Documents\Dauntless\Macro\bamboo.mp3"
keyToSend := "v"  ; Make sure this is the correct key
inventorykey := "i"
emotekey := "t"
jumpkey := "f"

; Close the script when the game closes
WinWaitClose, % "ahk_id " WinExist(dauntlessExe)
ExitApp

F1::
    toggle := !toggle

    if (toggle) {
        SoundPlay, %soundFilePath1%
    } else {
        SoundPlay, %soundFilePath2%
    }

    while (toggle) {
        ControlSend,, {%keyToSend% Down}, Dauntless
        Sleep, 320
        ControlSend,, {%keyToSend% Up}, Dauntless
    }
return

F2::
    ControlSend,, {%inventorykey%}, Dauntless
    Sleep, 320
    Click 1140, 870
    Sleep, 320
    Click 780, 870
    Sleep, 320
    ControlSend,, {%inventorykey%}, Dauntless
    Sleep, 320
return

F3::
    ControlSend,, {%emotekey% Down}, Dauntless
    Sleep, 400
    ControlSend,, {%emotekey% Up}, Dauntless
    Sleep, 2000
    ControlSend,, {%jumpkey%}, Dauntless
return

!r::Reload  ; Alt + R to reload the script
~F4::ExitApp  ; F4 to exit the script
