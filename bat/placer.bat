@echo off
title Command placer
color 09

:st
if not "%~1"=="" (
	xcopy %~1 C:\WINDOWS\System32 /q /y /exclude:.png+.ico
	shift
	goto st
)
pause