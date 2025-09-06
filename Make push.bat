@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

:: Переход в папку проекта (где находится .bat файл)
:: Transition to the project folder (where is the .bat file)
cd /d "%~dp0"

:: Проверка статуса Git
echo Status ▼
git status
if %errorlevel% neq 0 (
    echo Ошибка: Not found Git-repository
    pause
    exit /b
)

echo.
:: Запрос сообщения коммита
set /p commit_msg="Enter commit name: "

:: Выполнение Git-команд
echo Adding edited files
git add .
echo.
echo Apply commit
git commit -m "!commit_msg!"
if %errorlevel% neq 0 (
    echo Error during commit
    pause
    exit /b
)

echo.
set /p branch_name="Branch for push: "
git push origin %branch_name%
if %errorlevel% neq 0 (
    echo Error during push
    pause
    exit /b
)

echo Successfully, changens are added, push and sent!
timeout /t 5
exit