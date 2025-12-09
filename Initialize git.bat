@echo off
cd /d "%~dp0"

git init

set /p repo_link="Link to yout repository: "
git remote add origin %repo_link%
if errorlevel 0 (
    echo Connected!
    pause
)

echo To avoid always entering git config, run the command in Git Bash > git config --global user.name "your username"

echo git config --global user.email "your email" 

git status

echo Git is successfully initialized and connected!
timeout /t 3