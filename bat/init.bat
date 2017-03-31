@echo off

rem Copyrights (c) 2016 Maximilian Berkmann
rem Console initialisation program
cls

:st
if not "%~1"=="" (
	if not "%~2"=="" title %~2
	if "%~2"=="" title Terminal
	if /i "%~1"=="r" color 0C
	if /i "%~1"=="g" color 0A
	if /i "%~1"=="b" color 09
	if /i "%~1"=="w" color 0F
	if /i "%~1"=="y" color 0E
	if /i "%~1"=="c" color 0B
	if /i "%~1"=="s" color 08
	if /i "%~1"=="p" color 0D
	if /i "%~1"=="wr" color F4
	if /i "%~1"=="wg" color F2
	if /i "%~1"=="wb" color F1
	if /i "%~1"=="wy" color F6
	if /i "%~1"=="wc" color F3
	if /i "%~1"=="ws" color F8
	if /i "%~1"=="wp" color F5
	if /i "%~1"=="f00" color C0
	if /i "%~1"=="0f0" color A0
	if /i "%~1"=="00f" color 90
	if /i "%~1"=="fff" color F0
	if /i "%~1"=="ff0" color E0
	if /i "%~1"=="0ff" color B0
	if /i "%~1"=="ccc" color 80
	if /i "%~1"=="f0f" color D0
	if /i "%~1"=="def" color
	if "%~1"=="" color 0A
	if not "%~3"=="echo" @echo off
	if "%~1"=="-?" goto help
	if "%~1"=="/?" goto help
	shift
)
exit /b

:help
echo Initialise the console.
echo Usage: init [attr] [title] [echo]
echo.
echo   attr       Specify the colour to be used.
echo   title      Title of the current cmd instance which is Terminal by default.
echo   echo       If this option is on, it will keep the echo on.
echo.
echo The available colours are the following:
echo.
echo   r: red text on black background
echo   g: green text on black background
echo   b: blue text on black background
echo   w: white text on black background
echo   y: yellow text on black background
echo   c: cyan text on black background
echo   s: gray text on black background
echo   p: purple text on black background
echo   wr: red text on white background
echo   wg: green text on white background
echo   wb: blue text on white background
echo   wy: yellow text on white background
echo   wc: cyan text on white background
echo   ws: gray text on white background
echo   wp: purple text on white background
echo   f00: black text on red background
echo   0f0: black text on green background
echo   00f: black text on blue background
echo   ff0: black text on yellow background
echo   0ff: black text on cyan background
echo   ccc: black text on gray background
echo   f0f: purple text on gray background
echo   def: default colours of color.
echo   : same as g.
exit /b
