@echo off

rem Copyrights (c) 2016 Maximilian Berkmann
rem Random decimal text file maker.

:st
if not "%~1"=="" (
  if /i "%~1"=="/?" goto help
  goto main
  shift
  goto st
)

:help
echo Random decimal text file maker.
echo Usages: mrd [cols] [rows] [name]
echo.
echo   cols       Number of columns.
echo   rows       Number of rows.
exit /b

:main
for %%r in (0, ..., %~2) do (
	set l=
	for %%c in (0, ..., %~1) do %l%=%l%+%random%
	echo %l%>>%~3.txt
	echo.>>%~3.txt
)
exit /b
