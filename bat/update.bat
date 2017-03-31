@echo off

rem Copyrights (c) 2016 Maximilian Berkmann
rem Command updater

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if "%~2"=="" goto help
	xcopy %~1\*.%~2 %windir%\System32
	exit /b
)

:help
echo Update a dev directory onto the global executable environment (System32 for Windows)
echo Usage: update [dir] [format]
echo.
echo   dir        Specify the working directory to be used for the update.
echo   format     Format of the programs/softwares/files to update. e.g: exe, bat, sh, py)
exit /b