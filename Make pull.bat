@echo off
cd /d "%~dp0"

git fetch
if errorlevel 1 (
    echo Error when receiving changes
    pause
)

set /p branch_name="From which branch do pull: "
git pull origin %branch_name%
if errorlevel 1 (
    echo Merging error
    pause
)

echo.
echo Pull LFS files
git lfs pull

echo The project is successfully updated!
timeout /t 3