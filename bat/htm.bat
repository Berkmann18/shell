@echo off

rem htm
rem Copyrights (c) 2016 Maximilian Berkmann
rem An html page maker.

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~2"=="/e" goto ext
	if /i "%~2"=="/$" goto essence
	if /i "%~2"=="/h5" goto html5
	if "%~2"=="" goto main
	shift /2
	goto st
)

:help
echo Make an html page with pre-written code.
echo Usage: htm [name] [/e ^| /$ ^| /h5]
echo.
echo   No args    Make a normal html page.
echo   /e         Specify that the ressources (i.e: stylesheets and scripts) are external files.
echo   /$         Import Essence.min.js.
echo   /h5        do the DHTML2 way.
exit /b

:main
echo ^<!doctype html^>>%~1.html
echo ^<html^>>>%~1.html
echo ^<head^>>>%~1.html
echo   ^<title^>%~1^</title^>>>%~1.html
echo   ^<meta charset="UTF-8" ^/^>>>%~1.html
echo   ^<meta name="author" content="Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<meta name="generator" content="htm.bat" ^/^>>>%~1.html
echo   ^<meta name="description" content="" ^/^>>>%~1.html
echo   ^<meta name="keywords" content="%~1, " ^/^>>>%~1.html
echo   ^<meta name="copyrights" content="Copyright (c) 2016 Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<style type="text/css"^>>>%~1.html
echo     * {>>%~1.html
echo       font-family: Calibrie, Verdana, Segoe UI;>>%~1.html
echo     }>>%~1.html
echo   ^</style^>>>%~1.html
echo   ^<script type="text/javascript"^>>>%~1.html
echo     window.onError = function(msg, url, line)^{>>%~1.html
echo       alert("An error has occurred.\n\nMessage: "+msg+"\nURL: "+url+"\nLine number: "+line);>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo   ^</script^>>>%~1.html
echo ^</head^>>>%~1.html
echo ^<body^>>>%~1.html
echo.  >>%~1.html
echo ^</body^>>>%~1.html
echo ^</html^>>>%~1.html
exit /b

:ext
echo ^<!doctype html^>>%~1.html
echo ^<html^>>>%~1.html
echo ^<head^>>>%~1.html
echo   ^<title^>%~1^</title^>>>%~1.html
echo   ^<meta charset="UTF-8" ^/^>>>%~1.html
echo   ^<meta name="author" content="Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<meta name="generator" content="htm.bat" /^>>>%~1.html
echo   ^<meta name="description" content="" ^/^>>>%~1.html
echo   ^<meta name="keywords" content="%~1, " ^/^>>>%~1.html
echo   ^<meta name="copyrights" content="Copyright (c) 2016 Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<link rel="stylesheet" type="text/css" href="css/style.css" ^/^>>>%~1.html
echo   ^<script type="text/javascript"^ src="js/script.js"^>^</script^>>>%~1.html
echo   ^<script type="text/javascript"^>>>%~1.html
echo.    >>%~1.html
echo   ^</script^>>>%~1.html
echo ^</head^>>>%~1.html
echo ^<body^>>>%~1.html
echo.  >>%~1.html
echo ^</body^>>>%~1.html
echo ^</html^>>>%~1.html
shift /2
if not "%~2"=="" goto st
exit /b

:essence
echo ^<!doctype html^>>%~1.html
echo ^<html^>>>%~1.html
echo ^<head^>>>%~1.html
echo   ^<title^>%~1^</title^>>>%~1.html
echo   ^<meta charset="UTF-8" ^/^>>>%~1.html
echo   ^<meta name="author" content="Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<meta name="generator" content="htm.bat" ^/^>>>%~1.html
echo   ^<meta name="description" content="" ^/^>>>%~1.html
echo   ^<meta name="keywords" content="%~1, " ^/^>>>%~1.html
echo   ^<meta name="copyrights" content="Copyright (c) 2016 Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<link rel="stylesheet" content="css/style.css" ^/^>>>%~1.html
echo   ^<script type="text/javascript"^ src="js/essence.min.js"^>^</script^>>>%~1.html
echo   ^<script type="text/javascript"^>>>%~1.html
echo     Essence.applyCSS();>>%~1.html
echo.    >>%~1.html
echo   ^</script^>>>%~1.html
echo ^</head^>>>%~1.html
echo ^<body^>>>%~1.html
echo.  >>%~1.html
echo ^</body^>>>%~1.html
echo ^</html^>>>%~1.html
shift /2
shift /2
if not "%~2"=="" goto st
exit /b

:html5
echo ^<!doctype html^>>%~1.html
echo ^<html^>>>%~1.html
echo ^<head^>>>%~1.html
echo   ^<title^>%~1^</title^>>>%~1.html
echo   ^<meta charset="UTF-8" ^/^>>>%~1.html
echo   ^<meta name="author" content="Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<meta name="generator" content="htm.bat" ^/^>>>%~1.html
echo   ^<meta name="description" content="" ^/^>>>%~1.html
echo   ^<meta name="keywords" content="%~1, " ^/^>>>%~1.html
echo   ^<meta name="copyrights" content="Copyright (c) 2016 Maximilian Berkmann" ^/^>>>%~1.html
echo   ^<style type="text/css"^>>>%~1.html
echo     * {>>%~1.html
echo       font-family: Calibrie, Verdana, Segoe UI;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     html {>>%~1.html
echo.       >>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     body {>>%~1.html
echo.      >>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     header {>>%~1.html
echo       text-align: center;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     header img{>>%~1.html
echo       width: 64px;>>%~1.html
echo       height: 64px;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     menu {>>%~1.html
echo.      >>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     menu li{>>%~1.html
echo       display: inline-block;>>%~1.html
echo       cursor: pointer;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     menu a, a{>>%~1.html
echo       text-decoration: none;>>%~1.html
echo       color: #000;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     #content {>>%~1.html
echo.      >>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     footer {>>%~1.html
echo.      >>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     aside {>>%~1.html
echo.      >>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     :required {>>%~1.html
echo       border-color: #f00;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     .info {>>%~1.html
echo       color: #000080;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     .success {>>%~1.html
echo       color: #008000;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     .error {>>%~1.html
echo       color: #800000;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     .question {>>%~1.html
echo       color: #00f;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     .warning {>>%~1.html
echo       color: #fc0;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     a {>>%~1.html
echo       color: #00f;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     a:hover {>>%~1.html
echo       color: #0f0;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo     a:visited {>>%~1.html
echo       color: #0ff;>>%~1.html
echo     }>>%~1.html
echo.    >>%~1.html
echo   ^</style^>>>%~1.html
echo   ^<script type="text/javascript"^ src="js/script.js"^>^</script^>>>%~1.html
echo   ^<script type="text/javascript"^>>>%~1.html
echo.    >>%~1.html
echo   ^</script^>>>%~1.html
echo ^</head^>>>%~1.html
echo ^<body^>>>%~1.html
echo   ^<header^>^<img src="img/icon.png" /^>%~1^</header^>>>%~1.html
echo   ^<menu^>>>%~1.html
echo     ^<li id="home"^>Home^</li^>>>%~1.html
echo     ^<li id="About"^>About^</li^>>>%~1.html
echo     ^<li id="ContactUs"^>Contact us^</li^>>>%~1.html
echo   ^</menu^>>>%~1.html
echo   ^<div id="content"^>>>%~1.html
echo     ^<h3^>Welcome to %~1^</h3^>>>%~1.html
echo   ^</div^>>>%~1.html
echo   ^<aside^>>>%~1.html
echo.    >>%~1.html
echo   ^</aside^>>>%~1.html
echo   ^<footer^>>>%~1.html
echo.    >>%~1.html
echo   ^</footer^>>>%~1.html
echo ^</body^>>>%~1.html
echo ^</html^>>>%~1.html
shift /2
shift /2
if not "%~2"=="" goto st
exit /b