@echo off
cd /d "%~dp0"

git init

set /p repo_link="Link to yout repository: "
git remote add origin %repo_link%
if errorlevel 0 (
    echo Connected!
    pause
)

git status

echo Git is successfully initialized and connected!
timeout /t 3