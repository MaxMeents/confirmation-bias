@echo off
REM Double-click to open this folder in Windsurf.
REM Tries PATH first, falls back to the standard per-user install path.
where windsurf >nul 2>&1 && (start "" windsurf "%~dp0." & exit /b)
if exist "%LOCALAPPDATA%\Programs\Windsurf\Windsurf.exe" (
    start "" "%LOCALAPPDATA%\Programs\Windsurf\Windsurf.exe" "%~dp0."
    exit /b
)
echo Could not find Windsurf. Install it or add windsurf.exe to PATH.
pause
