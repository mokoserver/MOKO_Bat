@echo off
chcp 65001 > nul

echo =================================================================
echo  Universal Installer
echo  This script will install all required packages.
echo  It will automatically detect a PyCharm venv if it exists.
echo =================================================================
echo.

set PACKAGES=anyio certifi charset-normalizer et-xmlfile h11 httpcore httpx idna numpy==1.26.4 openpyxl pandas python-dateutil python-telegram-bot pytz requests selenium six sniffio tzdata urllib3 PyQt5 beautifulsoup4 lxml pillow

REM Check for PyCharm's virtual environment
if exist .\venv\Scripts\python.exe (
    echo Found PyCharm virtual environment. Installing packages into .\venv...
    echo.
    .\venv\Scripts\python.exe -m pip install --upgrade pip
    .\venv\Scripts\python.exe -m pip install %PACKAGES%
) else (
    echo No PyCharm venv found. Installing into the default Python environment.
    echo It is recommended to run this in an activated virtual environment.
    echo.
    pip install --upgrade pip
    pip install %PACKAGES%
)

echo.
echo =================================================================
echo Installation complete.
echo =================================================================
echo.
pause
