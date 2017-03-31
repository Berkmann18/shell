
@echo off

rem mdp
rem Copyrights (c) 2016 Maximilian Berkmann
rem A markdown file previewer

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~2"=="/b" goto browser
	if /i "%~2"=="/s" goto save
	if "%~2"=="" goto main
	shift /2
	goto st
)

:help
echo Preview a markdown document
echo Usage: mdp [name] [/b^|/s]
echo.
echo   No args    Display the html equivalent
echo   /b         Preview the HTML equivalent in the default browser.
echo   /s         Save the HTML equivalent into a file
exit /b

:main
markdown "%~1".md --stylesheet %DB%\Projects\EssenceJS\1.1\essence.css  --title "%~1"
shift /2
if not "%~2"=="" goto st
exit /b

:browser
markdownb "%~1".md --stylesheet %DB%\Projects\EssenceJS\1.1\essence.css  --title "%~1"
shift /2
if not "%~2"=="" goto st
exit /b

:save
markdown "%~1".md --stylesheet %DB%\Projects\EssenceJS\1.1\essence.css  --title "%~1" > "%~1".html
shift /2
if not "%~2"=="" goto st
exit /b