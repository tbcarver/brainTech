#Requires AutoHotkey v2.0
#SingleInstance

#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe VSCodium.exe") || WinActive("ahk_exe azuredatastudio.exe")
    ^LButton:: 
    {
        Click("Left Down")
        Send("^d")
        Click("Left Up")
        Sleep(50)
        Click("Left Down")
        KeyWait("LButton")
        Click("Left Up")
    }
    ^+LButton:: 
    {
        Send("^{Click}")
        return
    }
#HotIf
