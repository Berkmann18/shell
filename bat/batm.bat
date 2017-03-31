@echo off

rem batm
rem Copyrights (c) 2016 Maximilian Berkmann
rem A batch script maker.

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~4"=="/x" goto x
	if "%~4"=="" goto main
)


:help
echo Make a batch script.
echo Usage: batm [name] [title] [color] [/x]
echo.
echo   No args    Make a basic review file.
echo   /x         Specify that the script is a command (just like this one).
exit /b

:main
echo @echo off>%~1.bat
echo title %~2>>%~1.bat
echo color %~3>>%~1.bat
echo.>>%~1.bat
exit /b

:x
echo @echo off>%~1.bat
echo title %~2>>%~1.bat
echo color %~3>>%~1.bat
echo.>>%~1.bat
echo :st>>%~1.bat
echo if not "%1"=="" (>>%~1.bat
echo   if /i "%1"=="/?" goto help>>%~1.bat
echo   if /i "%1"=="/" goto >>%~1.bat
echo   if "%1"=="" goto main>>%~1.bat
echo   shift>>%~1.bat
echo   goto st>>%~1.bat
echo )>>%~1.bat
echo.>>%~1.bat
echo :help>>%~1.bat
echo echo Description.>>%~1.bat
echo echo Usages:>>%~1.bat
echo.>>%~1.bat
echo :main>>%~1.bat
echo.>>%~1.bat
echo exit /b>>
echo pause>>%~1.bat
exit /b