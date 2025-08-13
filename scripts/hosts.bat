@echo off

:: BatchGotAdmin
:: ------------------------
REM  -- Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM -- If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
    

:: --- MAIN SCRIPT ---
SET "hostsPath=%SystemRoot%\System32\drivers\etc\hosts"

call :AddTextIfNotExists "%hostsPath%" "127.0.0.1       localhost"
call :AddTextIfNotExists "%hostsPath%" "127.0.0.1       jenkins.localhost"
call :AddTextIfNotExists "%hostsPath%" "127.0.0.1       gitlab.localhost"
call :AddTextIfNotExists "%hostsPath%" "127.0.0.1       phpmyadmin.localhost"

pause

:: --- FUNCTIONS ---

:AddTextIfNotExists
:: %1 - file path
:: %2 - text to add
setlocal

set "file=%~1"
set "text=%~2"

:: Check if the file exists, create it if not
if not exist "%file%" (
    echo.>"%file%"
)

:: Check if the text already exists
findstr /C:"%text%" "%file%" >nul 2>&1

if errorlevel 1 (
    echo %text% >> "%file%"
    echo ADD: %text%
) else (
    :: echo IGNORE: %text%
)

endlocal
goto :eof