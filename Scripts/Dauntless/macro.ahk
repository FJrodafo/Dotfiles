#Requires AutoHotkey v1.0
#NoEnv
SendMode Input
#SingleInstance Force
#MaxThreadsPerHotkey 2

toggle := false
dauntlessExe := "ahk_exe Dauntless-Win64-Shipping.exe"
soundFilePath1 := "C:\Users\Franchu\Downloads\ding.wav"
soundFilePath2 := "C:\Users\Franchu\Downloads\Bamboo.mp3"
keyToSend := "0"  ; Make sure this is the correct key

; Close the script when the game closes
WinWaitClose, % "ahk_id " WinExist(dauntlessExe)
ExitApp

F5::
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

!r::Reload  ; Alt + R to reload the script
~F6::ExitApp  ; F6 to exit the script