@echo off
setlocal enabledelayedexpansion

:: ========================================================
:: CONFIGURATION
:: ========================================================
set "APP_PATH=C:\Program Files\Vowen\Vowen.exe"
set "AHK_NAME=SilentStartVowen.ahk"
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: ========================================================
:: STEP 1: CLEAN UP OLD ATTEMPTS
:: ========================================================
echo Killing Vowen if running...
taskkill /IM "Vowen.exe" /F >nul 2>&1

echo.
echo Removing old shortcuts and tasks...
del "%STARTUP_FOLDER%\Vowen.lnk" >nul 2>&1
del "%STARTUP_FOLDER%\Vowen - Shortcut.lnk" >nul 2>&1
schtasks /delete /tn "Start Vowen Hidden" /f >nul 2>&1

:: ========================================================
:: STEP 2: GENERATE AUTOHOTKEY SCRIPT
:: ========================================================
echo.
echo Generating silent launch script...

:: This block writes the AHK code directly into your startup folder
(
echo #Requires AutoHotkey v2.0
echo #SingleInstance Force
echo.
echo ; Attempt to run hidden first
echo Run "%APP_PATH%",, "Hide"
echo.
echo ; If the app forces a window, catch it and hide it immediately
echo if WinWait^("ahk_exe Vowen.exe",, 10^)
echo {
echo     WinHide
echo }
) > "%STARTUP_FOLDER%\%AHK_NAME%"

:: ========================================================
:: STEP 3: VERIFY AND FINISH
:: ========================================================
if exist "%STARTUP_FOLDER%\%AHK_NAME%" (
    echo.
    echo ========================================================
    echo [SUCCESS] FIXED.
    echo ========================================================
    echo A new script has been placed in your Startup folder.
    echo It will force Vowen to hide every time you log in.
    echo.
    echo Please RESTART your PC now to test.
) else (
    echo.
    echo [ERROR] Could not create the script.
    echo Please check your antivirus or run as Administrator.
)

pause
