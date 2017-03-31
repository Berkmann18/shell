@echo off

rem rev
rem Copyrights (c) 2016 Maximilian Berkmann
rem A review file maker.

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~3"=="/md" goto markdown
	if "%~3"=="" goto basic
	shift /3
	goto st
)


:help
echo Make a review file.
echo Usage: rev [URL] [title] [/md]
echo.
echo   No args    Make a basic review file.
echo   /md        Use markdown to create the review file.
pause
exit /b

:basic
echo Website review of: %~2 (%~1)>%~1.txt
echo.>>%~1.txt
echo   Layout:>>%~1.txt
echo.>>%~1.txt
echo.>>%~1.txt
echo   Features:>>%~1.txt
echo.>>%~1.txt
echo.>>%~1.txt
echo   Page Speed:>>%~1.txt
echo.>>%~1.txt
echo.>>%~1.txt
echo   Issues:>>%~1.txt
echo.>>%~1.txt
echo.>>%~1.txt
echo   Suggestions:>>%~1.txt
echo.>>%~1.txt
echo.>>%~1.txt
exit /b

:markdown
echo #Website review of: %~2 (%~1)>%~1.md
echo.>>%~1.md
echo   ##Layout:>>%~1.md
echo.>>%~1.md
echo.>>%~1.md
echo   ##Features:>>%~1.md
echo.>>%~1.md
echo.>>%~1.md
echo   ##Page Speed:>>%~1.md
echo.>>%~1.md
echo.>>%~1.md
echo   ##Issues:>>%~1.md
echo.>>%~1.md
echo.>>%~1.md
echo.>>%~1.md
echo   ##Suggestions:>>%~1.md
echo.>>%~1.md
echo.>>%~1.md
exit /b