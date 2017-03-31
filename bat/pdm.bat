@echo off
rem pdm
rem Copyrights (c) 2016 Maximilian Berkmann
rem A Processing program (processing development environment file) maker.

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~2"=="/c" goto class
	if /i "%~2"=="/k" goto keyP
	if /i "%~2"=="/title" goto ctitle
	if /i "%~2"=="/r" goto resizable
	if /i "%~2"=="/t" goto test
	if "%~2"=="" goto main
	shift /2
	goto st
)

:help
echo Make a pde program with pre-written code.
echo Usage: pdm [name] [/c][/k][/title title][/r][/t]
echo.
echo   No args    Make a normal pde program.
echo   /c         Specify that the pde program is a proper class (with constructer).
echo   /k         Implement a keyPressed handler.
echo   /title     Custom title.
echo   /r         Specify that the sketch is resizable.
echo   /t         Add an additionnal test class which is useful when combined with /c to the test the current class.
pause
exit /b

:main
echo void setup(){>%~1.pde
echo.  size(600, 400);>>%~1.pde
echo.  background(255);>>%~1.pde
echo.  smooth();>>%~1.pde
echo }>>%~1.pde
echo.>>%~1.pde
echo void draw(){>%~1.pde
echo.  >>%~1.pde
echo }>>%~1.pde
exit /b

:class
echo class %~1{>%~1.pde
echo.  >>%~1.pde
echo   %~1(){>>%~1.pde
echo.    >>%~1.pde
echo   }>>%~1.pde
echo.  >>%~1.pde
echo   public String toString(){>>%~1.pde
echo.    return "%~1(''=)";>>%~1.pde
echo   }>>%~1.pde
echo }>>%~1.pde
shift /2
if not "%~2"=="" goto st
exit /b

:keyP
echo.>>%~1.pde
echo void keyPressed(){>>%~1.pde
echo   if(key==CODED){>>%~1.pde
echo     if(keyCode==) ;>>%~1.pde
echo     if(keyCode==) ;>>%~1.pde
echo   }else if(key=='' || keyCode==) ;>>%~1.pde
echo   }else if(key=='' || keyCode==) ;>>%~1.pde
echo }>>%~1.pde

:ctitle
echo.>>%~1.pde
echo void settings(){>%~1.pde
echo.  frame.setTitle(%~2);>>%~1.pde
echo }>>%~1.pde

:resizable
echo.>>%~1.pde
echo void settings(){>%~1.pde
echo.  frame.setResizable(true);>>%~1.pde
echo }>>%~1.pde

:test
echo void setup(){>%~1.pde
echo.  size(600, 400);>>%~1.pde
echo.  background(255);>>%~1.pde
echo.  smooth();>>%~1.pde
echo }>>%~1.pde
echo.>>%~1.pde
echo %~1 obj = new %~1();>>%~1.pde
echo.>>%~1.pde
echo void draw(){>%~1.pde
echo.   >>%~1.pde
echo  println(obj.toString());>>%~1.pde
echo }>>%~1.pde
exit /b

shift /2
if not "%~2"=="" goto st
exit /b