#Requires AutoHotkey v2.0
#NoEnv
SendMode Input
#SingleInstance Force
#MaxThreadsPerHotkey 2

toggle := false
dauntlessExe := "ahk_exe Dauntless-Win64-Shipping.exe"
soundFilePath1 := "C:\Users\Username\Documents\Dauntless\Macro\ding.wav"
soundFilePath2 := "C:\Users\Username\Documents\Dauntless\Macro\bamboo.mp3"
keyToSend := "v"  ; Make sure this is the correct key
inventoryKey := "i"
emoteKey := "c"
jumpKey := "f"

; Close the script when the game closes
WinWaitClose("ahk_id " WinExist(dauntlessExe))
ExitApp

F5::
    toggle := !toggle

    if (toggle) {
        SoundPlay(soundFilePath1)
    } else {
        SoundPlay(soundFilePath2)
    }

    while (toggle) {
        ControlSend("{" keyToSend " Down}",, "Dauntless")
        Sleep 320
        ControlSend("{" keyToSend " Up}",, "Dauntless")
    }
return

F6:: {
    ControlSend("{" inventoryKey "}",, "Dauntless")
    Sleep 320
    Click(1140, 870)
    Sleep 320
    Click(780, 870)
    Sleep 320
    ControlSend("{" inventoryKey "}",, "Dauntless")
    Sleep 320
}

F7:: {
    ControlSend("{" emoteKey " Down}",, "Dauntless")
    Sleep 400
    ControlSend("{" emoteKey " Up}",, "Dauntless")
    Sleep 2000
    ControlSend("{" jumpKey "}",, "Dauntless")
}

F8:: {
    loop 2 {
        Sleep 40
        ControlSend("{" emoteKey " Down}",, "Dauntless")
        Sleep 50
        MouseMove(950, 530, 1)
        Sleep 100
        MouseMove(564, 0, 0)
        Sleep 5
        ; MouseClick
        ControlSend("{" emoteKey " Up}",, "Dauntless")
        Sleep 750
    }

    Sleep(40)
    ControlSend("{" emoteKey " Down}",, "Dauntless")
    Sleep 40
    MouseMove(950, 530, 0)
    Sleep(100)
    MouseMove(564, 0, 0)
    Sleep 5
    ; MouseClick
    ControlSend("{" emoteKey " Up}",, "Dauntless")

    Sleep 1970

    ControlSend("{" jumpKey " Down}",, "Dauntless")
    Sleep 100
    ControlSend("{" jumpKey " Up}",, "Dauntless")
}

!r::Reload    ; Alt + R para recargar el script
~F9::ExitApp  ; F9 para salir
