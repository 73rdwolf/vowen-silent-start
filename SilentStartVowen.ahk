#Requires AutoHotkey v2.0
#SingleInstance Force

; Attempt to run hidden first
Run "C:\Program Files\Vowen\Vowen.exe",, "Hide"

; If the app forces a window, catch it and hide it immediately
if WinWait("ahk_exe Vowen.exe",, 10)
{
    WinHide
}
