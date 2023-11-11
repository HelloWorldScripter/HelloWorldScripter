@echo off
color 5

title Checking Python Version
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed! Automatically downloading and installing...
    curl -o python_installer.exe https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe
    python_installer.exe /quiet InstallAllUsers=1 PrependPath=1
)

title Installing Requirements
cd /d "%~dp0"
echo Installing Requirements...
python -m pip install -r requirements.txt

cd tools
title Checking for updates
echo Checking for updates...
python update.py
