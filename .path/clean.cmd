@echo off

:description
echo this script will clean some temp files on your computer
echo list of these folder/files:

echo.
echo %USERPROFILE%\AppData\Local\Temp
echo C:\$Recycle.Bin\*.*

echo.

:prompt

echo are your sure you want to continue?
color E
set /p confirm=type yes to continue, others to quit:
if "%confirm%"=="yes" goto clean
goto end

:clean
cd %USERPROFILE%\AppData\Local
del c:\$Recycle.Bin\*.* /s /q /f
rmdir /S /Q TEMP


goto end

:end
color
echo have a nice day
