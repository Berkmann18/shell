@echo off

rem Copyrights (c) 2016 Maximilian Berkmann
rem Archive unarchiver.

:st
if not "%~1"=="" (
  if /i "%~1"=="/?" goto help
  goto main
  shift
  goto st
)

:help
echo An archive unarchiver.
echo Usage: unarch [arch] [name]
echo.
echo   name       Name of the resulting directory.
echo   arch       Name of the archive unarchive (preferrably .zip).
echo.
echo Full path is required for img and dir.
exit /b

:main
echo Set ArgObj = WScript.Arguments>unzip.vbs
echo If(Wscript.Arguments.Count>0) Then>>unzip.vbs
echo  var1 = ArgObj(0)>>unzip.vbs
echo Else>>unzip.vbs
echo var1 = "">>unzip.vbs
echo End if>>unzip.vbs
echo If var1 = "" then>>unzip.vbs
echo  strFileZIP = "example.zip">>unzip.vbs
echo Else>>unzip.vbs
echo  strFileZIP = var1>>unzip.vbs
echo End if>>unzip.vbs
echo 'The location of the zip file.>>unzip.vbs
echo REM Set WshShell = CreateObject("Wscript.Shell")>>unzip.vbs
echo REM CurDir = WshShell.ExpandEnvironmentStrings("%%cd%%")>>unzip.vbs
echo Dim sCurPath>>unzip.vbs
echo sCurPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")>>unzip.vbs
echo strZipFile = sCurPath & "\" & strFileZIP>>unzip.vbs
echo 'The folder the contents should be extracted to.>>unzip.vbs
echo outFolder = sCurPath & "\">>unzip.vbs
echo  WScript.Echo("Extracting file" & strFileZIP)>>unzip.vbs
echo Set objShell = CreateObject("Shell.Application")>>unzip.vbs
echo Set objSource = objShell.NameSpace(strZipFile).Items()>>unzip.vbs
echo Set objTarget = objShell.NameSpace(outFolder)>>unzip.vbs
echo intOptions = 256>>unzip.vbs
echo objTarget.CopyHere objSource, intOptions>>unzip.vbs
echo  WScript.Echo("Extracted.")>>unzip.vbs
echo ' This bit is for testing purposes>>unzip.vbs
echo REM Dim MyVar>>unzip.vbs
echo REM MyVar = MsgBox ( strZipFile, 65, "MsgBox Example">>unzip.vbs

cscript //B unzip.vbs %~1