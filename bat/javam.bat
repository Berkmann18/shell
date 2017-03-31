@echo off
rem javam
rem Copyrights (c) 2016 Maximilian Berkmann
rem A java program maker.

:st
if not "%~1"=="" (
	if /i "%~1"=="/?" goto help
	if /i "%~2"=="/c" goto class
	if /i "%~2"=="/s" goto scanner
	if /i "%~2"=="/fr" goto fileread
	if /i "%~2"=="/fw" goto filewrite
	if /i "%~2"=="/t" goto test
	if "%~2"=="" goto main
	shift /2
	goto st
)

:help
echo Make a java program with pre-written code.
echo Usage: javam [name] [/c ^| /s ^| /fr ^| /fw ^| /t]
echo.
echo   No args    Make a normal java program with a main() method.
echo   /c         Specify that the java program is a proper class (with constructer).
echo   /s         Implement a scanner.
echo   /fr        Add the minimal stuff so that the program can read files.
echo   /fw        Add the minimal stuff so that the program can write in files.
echo   /t         Add an additionnal test class which is useful when combined with /c to the test the current class.
exit /b

:main
echo class %~1{>%~1.java
echo   public static void main(String[] args){>>%~1.java
echo.    >>%~1.java
echo   }>>%~1.java
echo }>>%~1.java
exit /b

:class
echo class %~1{>%~1.java
echo.  >>%~1.java
echo   %~1(){>>%~1.java
echo.    >>%~1.java
echo   }>>%~1.java
echo.  >>%~1.java
echo   public String toString(){>>%~1.java
echo.    return "%~1(''=)";>>%~1.java
echo   }>>%~1.java
echo }>>%~1.java
shift /2
if not "%~2"=="" goto st
exit /b

:scanner
echo import java.utils.Scanner;>%~1.java
echo. >>Test%~1.java
echo class %~1{>>%~1.java
echo   public static void main(String[] args){>>%~1.java
echo     Scanner s = new Scanner(System.in);>>%~1.java
echo.    >>%~1.java
echo   }>>%~1.java
echo }>>%~1.java
shift /2
if not "%~2"=="" goto st
exit /b

:fileread
echo import java.utils.FileReader;>%~1.java
echo. >>Test%~1.java
echo class %~1{>>%~1.java
echo   public static void main(String[] args){>>%~1.java
echo     FileReader fr = new FileReader(".txt");>>%~1.java
echo.    >>%~1.java
echo   }>>%~1.java
echo }>>%~1.java
shift /2
if not "%~2"=="" goto st
exit /b

:filewrite
echo import java.utils.FileWriter;>%~1.java
echo. >>Test%~1.java
echo class %~1{>>%~1.java
echo   public static void main(String[] args){>>%~1.java
echo     FileWriter fw = new FileWriter(".txt");>>%~1.java
echo.    >>%~1.java
echo   }>>%~1.java
echo }>>%~1.java
shift /2
if not "%~2"=="" goto st
exit /b

:test
echo class Test%~1{>Test%~1.java
echo   %~1 obj = new %~1^();>>Test%~1.java
echo   public static void main(String[] args){>>Test%~1.java
echo.    >>Test%~1.java
echo     System.out.println(obj.toString());>>Test%~1.java
echo   }>>Test%~1.java
echo }>>Test%~1.java
shift /2
if not "%~2"=="" goto st
exit /b