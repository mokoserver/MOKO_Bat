@echo off
REM Recommended encoding: ANSI (Windows-1251)
setlocal enabledelayedexpansion

echo =================================================================
echo  Universal Installer v3.2
echo  Fixed loop iteration and version parsing.
echo =================================================================
echo.

REM =============================================================
REM 1. Packages List
REM IMPORTANT: Each package MUST be wrapped in quotes "..."
REM to handle versions like "numpy==1.26.4" correctly.
REM =============================================================
set "PACKAGES="anyio" "certifi" "charset-normalizer" "et-xmlfile" "h11" "httpcore" "httpx" "idna""
set "PACKAGES=%PACKAGES% "numpy==1.26.4" "openpyxl" "pandas" "python-dateutil" "python-telegram-bot""
set "PACKAGES=%PACKAGES% "pytz" "requests" "selenium" "six" "sniffio" "tzdata" "urllib3""
set "PACKAGES=%PACKAGES% "PyQt5" "beautifulsoup4" "lxml" "pillow" "python-docx""
set "PACKAGES=%PACKAGES% "webdriver-manager" "pyinstaller""

REM =============================================================
REM 2. Environment Setup
REM =============================================================
set "PIP_CMD=pip"
set "PYTHON_CMD=python"

if exist .\venv\Scripts\python.exe (
    echo [INFO] PyCharm venv detected.
    set "PIP_CMD=.\venv\Scripts\python.exe -m pip"
    set "PYTHON_CMD=.\venv\Scripts\python.exe"
) else (
    echo [INFO] Global Python environment.
)

echo.

REM Update pip first
echo [1/2] Updating pip...
%PYTHON_CMD% -m pip install --upgrade pip >nul 2>&1

REM =============================================================
REM 3. Preparation for Report
REM =============================================================
set "LOG_FILE=%TEMP%\pip_log.txt"
set "REP_INSTALLED=%TEMP%\report_installed.txt"
set "REP_SKIPPED=%TEMP%\report_skipped.txt"
set "REP_FAILED=%TEMP%\report_failed.txt"

type nul > "%REP_INSTALLED%"
type nul > "%REP_SKIPPED%"
type nul > "%REP_FAILED%"

REM =============================================================
REM 4. Installation Loop
REM =============================================================
echo [2/2] Installing packages...
echo ---------------------------------------------------------

REM Standard FOR loop works perfectly if items are quoted.
REM %%~p removes the quotes for display purposes.

for %%p in (%PACKAGES%) do (
   set "CURRENT_PKG=%%~p"
   call :ProcessPackage
)
goto :ReportSection

:ProcessPackage
<nul set /p "=Processing: !CURRENT_PKG! ... "

REM Run pip
%PIP_CMD% install "!CURRENT_PKG!" > "%LOG_FILE%" 2>&1

REM Analyze the log
find "Successfully installed" "%LOG_FILE%" >nul 2>&1
if !errorlevel! equ 0 (
    echo [INSTALLED]
    echo !CURRENT_PKG! >> "%REP_INSTALLED%"
    goto :EOF
)

find "Requirement already satisfied" "%LOG_FILE%" >nul 2>&1
if !errorlevel! equ 0 (
    echo [OK]
    echo !CURRENT_PKG! >> "%REP_SKIPPED%"
    goto :EOF
)

REM If neither, it's an error
echo [ERROR]
echo !CURRENT_PKG! >> "%REP_FAILED%"
goto :EOF

REM =============================================================
REM 5. Final Summary Table
REM =============================================================
:ReportSection
echo ---------------------------------------------------------
echo.

echo =================================================================
echo                      INSTALLATION REPORT
echo =================================================================
echo.

echo [NEWLY INSTALLED]:
type "%REP_INSTALLED%" | find /v "" >nul
if errorlevel 1 (
    echo  ^(None^)
) else (
    for /f "tokens=*" %%i in ('type "%REP_INSTALLED%"') do echo   - %%i
)
echo.

echo [ALREADY INSTALLED / UP TO DATE]:
type "%REP_SKIPPED%" | find /v "" >nul
if errorlevel 1 (
    echo  ^(None^)
) else (
    for /f "tokens=*" %%i in ('type "%REP_SKIPPED%"') do echo   - %%i
)
echo.

echo [FAILED]:
type "%REP_FAILED%" | find /v "" >nul
if errorlevel 1 (
    echo  ^(None^)
) else (
    for /f "tokens=*" %%i in ('type "%REP_FAILED%"') do echo   - %%i
)

echo.
echo =================================================================
echo Cleanup...
del "%LOG_FILE%" "%REP_INSTALLED%" "%REP_SKIPPED%" "%REP_FAILED%" >nul 2>&1
echo Done.
echo =================================================================
pause