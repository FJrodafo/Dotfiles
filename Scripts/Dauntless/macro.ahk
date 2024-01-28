#Requires AutoHotkey v1.0
#NoEnv
SendMode Input
#SingleInstance Force
#MaxThreadsPerHotkey 2

toggle := false
dauntlessExe := "ahk_exe Dauntless-Win64-Shipping.exe"
soundFilePath1 := "C:\Users\Franchu\Downloads\ding.wav"
soundFilePath2 := "C:\Users\Franchu\Downloads\Bamboo.mp3"
keyToSend := "F1"  ; Make sure this is the correct key
emotekey := "b"
jumpkey := "f"

; Close the script when the game closes
WinWaitClose, % "ahk_id " WinExist(dauntlessExe)
ExitApp

F2::
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

F3::
    ControlSend,, {%emotekey% Down}, Dauntless
    Sleep, 400
    ControlSend,, {%emotekey% Up}, Dauntless
    Sleep, 2000
    ControlSend,, {%jumpkey% Down}, Dauntless
    ControlSend,, {%jumpkey% Up}, Dauntless
return

!r::Reload  ; Alt + R to reload the script
~F4::ExitApp  ; F4 to exit the script