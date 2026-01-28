# Vowen Silent Start Fix

A utility script to manage and automate the silent startup of **Vowen**. This script ensures that old shortcuts and tasks are cleaned up and replaced with a reliable AutoHotkey (AHK) based silent launch mechanism.

## 🚀 Overview

Many applications struggle to remain hidden on startup even when configured to do so. This script solves that by:
1. **Cleaning up** legacy startup items (shortcuts and scheduled tasks).
2. **Generating** a dedicated AutoHotkey script tailored to your environment.
3. **Placing** that script in your Windows Startup folder to handle hidden execution and window management.

## 📋 Prerequisites

- **AutoHotkey v2.0+**: The generated script requires AHK v2 to run.
- **Vowen**: The application this script is designed to manage.

## 🛠️ Installation & Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/73rdwolf/vowen-silent-start.git
   ```
2. **Review the Configuration**: Open `vowen_fix.bat` and ensure `APP_PATH` matches your actual Vowen installation directory.
3. **Run the Script**: Execute `vowen_fix.bat` as an Administrator to ensure it has permissions to write to the Startup folder.
4. **Restart**: Reboot your PC to verify the silent startup.

## ⚙️ How it works

The batch file creates an `.ahk` script that:
- Uses `WinWait` to detect the application window.
- Immediately calls `WinHide` if the application forces itself to the foreground.
- Runs with `#SingleInstance Force` to prevent duplicate processes.

## ⚠️ Troubleshooting

- **Permissions**: If the script fails to create the AHK file, ensure you are running the batch file with Administrative privileges.
- **Antivirus**: Some antivirus software may flag the generation of startup scripts. You may need to whitelist the action.

---
*Created for safe keeping and professional deployment.*
