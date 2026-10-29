@echo off
setlocal enabledelayedexpansion

rem ===== CONFIG =====
if "%~1"=="" (set "ROOT=%CD%") else (set "ROOT=%~1")
set "FIND=serious"
set "REPLACE=neutral"
set "MASK=*%FIND%*.png"
set "DRYRUN=0"
rem ==================

for /r "%ROOT%" %%F in (%MASK%) do (
    set "name=%%~nxF"
    set "newname=!name:%FIND%=%REPLACE%!"
    if /i not "!name!"=="!newname!" (
        if "%DRYRUN%"=="1" (
            echo [DRY] "%%~F"  --^>  "!newname!"
        ) else (
            echo "%%~F"  --^>  "!newname!"
            ren "%%~F" "!newname!"
        )
    )
)

endlocal
pause