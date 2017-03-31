@echo off

rem Copyrights (c) 2016 Maximilian Berkmann
rem Directory archiver.

:st
if not "%~1"=="" (
  if /i "%~1"=="/?" goto help
  goto main
  shift
  goto st
)

:help
echo A directory archiver.
echo Usage: arch [dir] [name]
echo.
echo   name       Name of the resulting archive (zip).
echo   dir        Directory containing the files.
echo.
echo Full path is required for dir.
exit /b

:main
set FILETOZIP=%cd%\%~1
set TEMPDIR=%cd%\tempZ
rmdir /s /q %TEMPDIR%
mkdir %TEMPDIR%
xcopy /s %FILETOZIP% %TEMPDIR%

echo Set objArgs = WScript.Arguments > zipIt.vbs
echo InputFolder = objArgs(0) >> zipIt.vbs
echo ZipFile = objArgs(1) >> zipIt.vbs
echo CreateObject("Scripting.FileSystemObject").CreateTextFile(ZipFile, True).Write "PK" ^& Chr(5) ^& Chr(6) ^& String(18, vbNullChar) >> zipIt.vbs
echo Set objShell = CreateObject("Shell.Application") >> zipIt.vbs
echo Set source = objShell.NameSpace(InputFolder).Items >> zipIt.vbs
echo objShell.NameSpace(ZipFile).CopyHere(source) >> zipIt.vbs
echo wScript.Sleep 2000 >> zipIt.vbs

CScript  zipIt.vbs  %TEMPDIR%  %cd%\%~2.zip /b
del /q zipIt.vbs
rd /s /q %TEMPDIR%
exit /b