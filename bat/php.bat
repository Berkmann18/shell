@echo off

rem php
rem Copyrights (c) 2016 Maximilian Berkmann
rem An php page maker.

if exist %PHPDIR% cd %PHPDIR%

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~2"=="/h" goto html
	if /i "%~2"=="/e" goto htmlext
	if "%~2"=="" goto main
	shift /2
	goto st
)

:help
echo Make a php page with pre-written code.
echo Usage: php [name] [/h ^| /e]
echo.
echo   No args    Make a normal html page.
echo   /h         Add HTML code.
echo   /e         Add HTML code with external link.
exit /b
:main
echo ^<?php >%~1.php
echo    require('../essence.php');>>%~1.php
echo.   >>%~1.php
echo ?^>>>%~1.php
exit /b

:html
echo ^<!doctype html^>>%~1.php
echo ^<html^>>>%~1.php
echo ^<head^>>>%~1.php
echo   ^<title^>%~1^</title^>>>%~1.php
echo   ^<meta charset="UTF-8" ^/^>>>%~1.php
echo   ^<meta name="author" content="Maximilian Berkmann" ^/^>>>%~1.php
echo   ^<meta name="generator" content="php.bat" ^/^>>>%~1.php
echo   ^<meta name="description" content="" ^/^>>>%~1.php
echo   ^<meta name="keywords" content="%~1, " ^/^>>>%~1.php
echo   ^<meta name="copyrights" content="Copyright (c) 2016 Maximilian Berkmann" ^/^>>>%~1.php
echo   ^<style type="text/css"^>>>%~1.php
echo     * {>>%~1.php
echo       font-family: Calibrie, Verdana, Segoe UI;>>%~1.php
echo     }>>%~1.php
echo   ^</style^>>>%~1.php
echo   ^<script type="text/javascript"^>>>%~1.php
echo     window.onError = function(msg, url, line)^{>>%~1.php
echo       alert("An error has occurred.\n\nMessage: "+msg+"\nURL: "+url+"\nLine number: "+line);>>%~1.php
echo     }>>%~1.php
echo.    >>%~1.php
echo   ^</script^>>>%~1.php
echo ^</head^>>>%~1.php
echo ^<body^>>>%~1.php
echo ^<?php >>%~1.php
echo    require('../essence.php');>>%~1.php
echo.   >>%~1.php
echo ?^>>>%~1.php
echo.  >>%~1.php
echo ^</body^>>>%~1.php
echo ^</html^>>>%~1.php
</head>
<body>
shift /2
if not "%~2"=="" goto st
exit /b

:htmlext
echo ^<!doctype html^>>%~1.php
echo ^<html^>>>%~1.php
echo ^<head^>>>%~1.php
echo   ^<title^>%~1^</title^>>>%~1.php
echo   ^<meta charset="UTF-8" ^/^>>>%~1.php
echo   ^<meta name="author" content="Maximilian Berkmann" ^/^>>>%~1.php
echo   ^<meta name="generator" content="php.bat" ^/^>>>%~1.php
echo   ^<meta name="description" content="" ^/^>>>%~1.php
echo   ^<meta name="keywords" content="%~1, " ^/^>>>%~1.php
echo   ^<meta name="copyrights" content="Copyright (c) 2016 Maximilian Berkmann" ^/^>>>%~1.php
echo   ^<link rel="stylesheet" content="style.css" ^/^>>>%~1.php
echo   ^<script type="text/javascript"^ src="script.js"^>^</script^>>>%~1.php
echo   ^<script type="text/javascript"^>>>%~1.php
echo.    >>%~1.php
echo   ^</script^>>>%~1.php
echo ^</head^>>>%~1.php
echo ^<body^>>>%~1.php
echo ^<?php >>%~1.php
echo    require('../essence.php');>>%~1.php
echo.   >>%~1.php
echo ?^>>>%~1.php
echo.  >>%~1.php
echo ^</body^>>>%~1.php
echo ^</html^>>>%~1.php

shift /2
if not "%~2"=="" goto st
exit /b
