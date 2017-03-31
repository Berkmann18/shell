@echo off

rem Copyrights (c) 2016 Maximilian Berkmann
rem Multi Console initialisation program

cls

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~2"=="0" goto blackBG
	if /i "%~2"=="1" goto whiteBG
	if /i "%~2"=="2" goto clrBG
	if /i "%~2"=="def" goto def
	if /i "%~2"=="" goto blackBG
	if not "%~3"=="" set pcmd="%~3"
	if "%~3"=="" set pcmd=@echo off
	if not "%~4"=="" set /a w="%~4"/8
	if "%~4"=="" set w=200
	if not "%~5"=="" set /a h="%~5"/8
	if "%~5"=="" set h=78
	shift
	goto st
)
exit /b

:help
echo Initialise the console.
echo Usage: multi [n] [cs] [command] [width] [height]
echo.
echo   n          Number of consoles to open that is ranging between 1 and 4.
echo   cs         Colour scheme to use.
echo   command    Pre-command to be executed on each instances (like @echo off, prompt ...)
echo   width      Width of the monitor which is by default 200.
echo   height     Height of the monitor which is by default 78.
echo.
echo The available color scheme are the following:
echo.
echo   0: Black background with bright coloured text (default value).
echo   1: White background with dark coloured text.
echo   2: Coloured background with black text.
echo   def: default colour scheme of cmd.
exit /b

:blackBG
if "%~1"=="1" start "Terminal 1" cmd /q /t:0A "%pcmd%&mode con: cols=%w% lines=%h%"
if "%~1"=="2"(
	start "Terminal 1" cmd /q /t:0A "%pcmd%&mode con: cols=%w%/2 lines=%h%"
	start "Terminal 2" cmd /q /t:09 "%pcmd%&mode con: cols=%w%/2 lines=%h%"
)
if "%~1"=="3"(
	start "Terminal 1" cmd /q /t:0A "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q /t:09 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q /t:0C "%pcmd%&mode con: cols=%w% lines=%h%/2"
)
if "%~1"=="4"(
	start "Terminal 1" cmd /q /t:0A "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q /t:09 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q /t:0C "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 4" cmd /q /t:0F "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
)
pause

:whiteBG
if "%~1"=="1" start "Terminal 1" cmd /q /t:F2 "%pcmd%&mode con: cols=%w% lines=%h%"
if "%~1"=="2"(
	start "Terminal 1" cmd /q /t:F2 "%pcmd%&mode con: cols=%w%/2 lines=%h%"
	start "Terminal 2" cmd /q /t:F1 "%pcmd%&mode con: cols=%w%/2 lines=%h%"
)
if "%~1"=="3"(
	start "Terminal 1" cmd /q /t:F2 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q /t:F1 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q /t:F4 "%pcmd%&mode con: cols=%w% lines=%h%/2"
)
if "%~1"=="4"(
	start "Terminal 1" cmd /q /t:F2 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q /t:F1 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q /t:F4 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 4" cmd /q /t:F6 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
)
pause

:clrBG
if "%~1"=="1" start "Terminal 1" cmd /q /t:A0 "%pcmd%&mode con: cols=%w% lines=%h%"
if "%~1"=="2"(
	start "Terminal 1" cmd /q /t:A0 "%pcmd%&mode con: cols=%w%/2 lines=%h%"
	start "Terminal 2" cmd /q /t:90 "%pcmd%&mode con: cols=%w%/2 lines=%h%"
)
if "%~1"=="3"(
	start "Terminal 1" cmd /q /t:A0 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q /t:90 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q /t:C0 "%pcmd%&mode con: cols=%w% lines=%h%/2"
)
if "%~1"=="4"(
	start "Terminal 1" cmd /q /t:A0 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q /t:90 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q /t:C0 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 4" cmd /q /t:F0 "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
)
 
:def
if "%~1"=="1" start "Terminal 1" cmd /q "%pcmd%&mode con: cols=%w% lines=%h%"
if "%~1"=="2"(
	start "Terminal 1" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%"
	start "Terminal 2" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%"
)
if "%~1"=="3"(
	start "Terminal 1" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q "%pcmd%&mode con: cols=%w% lines=%h%/2"
)
if "%~1"=="4"(
	start "Terminal 1" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 2" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 3" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
	start "Terminal 4" cmd /q "%pcmd%&mode con: cols=%w%/2 lines=%h%/2"
)
pause