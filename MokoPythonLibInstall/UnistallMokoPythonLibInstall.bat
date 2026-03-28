@echo off
REM Recommended encoding: ANSI (Windows-1251)
setlocal enabledelayedexpansion

echo =================================================================
echo  Universal Uninstaller
echo  This script will remove packages installed by the installer.
echo =================================================================
echo.

REM =============================================================
REM 1. List of packages to remove (NO versions needed here)
REM =============================================================
set "PACKAGES=anyio certifi charset-normalizer et-xmlfile h11 httpcore httpx idna"
set "PACKAGES=%PACKAGES% numpy openpyxl pandas python-dateutil python-telegram-bot"
set "PACKAGES=%PACKAGES% pytz requests selenium six sniffio tzdata urllib3"
set "PACKAGES=%PACKAGES% PyQt5 beautifulsoup4 lxml pillow python-docx"
set "PACKAGES=%PACKAGES% webdriver-manager pyinstaller"

REM =============================================================
REM 2. Environment Setup
REM =============================================================
set "PIP_CMD=pip"

if exist .\venv\Scripts\python.exe (
    echo [INFO] PyCharm venv detected. Removing from .\venv...
    set "PIP_CMD=.\venv\Scripts\python.exe -m pip"
) else (
    echo [INFO] Global Python environment detected.
)

echo.

REM =============================================================
REM 3. Uninstall Loop
REM =============================================================
echo Starting uninstallation...
echo ---------------------------------------------------------

for %%p in (%PACKAGES%) do (
    echo Uninstalling: %%p
    %PIP_CMD% uninstall -y %%p
)

echo ---------------------------------------------------------
echo.
echo =================================================================
echo Uninstallation complete.
echo =================================================================
echo.
pause