@Echo off
:: Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
Echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
Echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
Echo UAC.ShellExecute "%~s0", "%*", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
Exit 

:gotAdmin
if exist "%temp%\getadmin.vbs" ( Del "%temp%\getadmin.vbs" )
Pushd "%CD%"
CD /D "%~dp0"
:--------------------------------------
cmd.exe /k %*