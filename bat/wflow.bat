@echo off

rem Copyrights (c) 2016 Maximilian Berkmann
rem Workflow initialiser

cls

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~1"=="DB" start "Dropbox" cmd /q /t:3F /k "cd %DB%"
	if /i "%~1"=="Meteor" start "Meteor" cmd /q /t:4F /k "cd %userprofile%\MeteorApps"
	if /i "%~1"=="Mongo" start "Meteor MongoDB" cmd /q /t:CF /k "cd %userprofile%\MeteorApps\"
	if /i "%~1"=="CLion" start "[CLion] C/C++" cmd /q /t:0B /k "cd %userprofile%\ClionProjects\"
	if /i "%~1"=="WebStorm" start "[WebStorm] DHTML2" cmd /q /t:9F /k "cd %userprofile%\WebstormProjects\"
	if /i "%~1"=="PyCharm" start "[PyCharm] Python" cmd /q /t:02 /k "cd %userprofile%\PycharmProjects\"
	if /i "%~1"=="PhpStorm" start "[PhpStorm] PHP" cmd /q /t:0D /k "cd %userprofile%\PhpstormProjects\"
	if /i "%~1"=="PHP" start "PHP & MySQL" cmd /q /t:5F /k "cd %PHPDIR%"
	if /i "%~1"=="Sublime" start "Sublime Console" cmd /q /t:3E /k "subl"
	if /i "%~1"=="Proj" start "Terminal" cmd /q /t:0A /k "cd %DB%\Projects"
	if /i "%~1"=="cli" start "CLI Dev" cmd /q /t:0F /k "cd %DB%\Script"
	shift
	goto st
)
exit /b

:help
echo Initialise the workflow.
echo Usage: wflow [name0] [...] [nameN]
echo   name       Name of the terminal (it must related to the directory used)
exit /b
rem Colours:
rem 0A: ba/g, 09: ba/b, 0C: ba/r, 0F: ba/w
rem F2: w/g, F1: w/b, F4: w/r, F0: w/ba
