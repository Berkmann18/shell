#!/bin/bash
function php {
	if [ -z "$1" ]; then
		php script
	fi
	if [ "$1" == "-e" -o "$2" == "-e" -o "$1" == "--essence" -o "$2" == "--essence" ]; then
		echo -e "<?php\r\trequire(\"essence.php\");\r\t\r?>" > "$1".php
	elif [ "$1" == "-c" -o "$1" == "--html" -o "$2" == "-c" -o "$2" == "--html" ]; then
		echo -e "<!DOCTYPE html>\r<html lang=\"en\">\r<head>\r\t<title>$1</title>\r\t<meta charset=\"UTF-8\" />\r\t<meta name=\"author\" content=\"Maximilian Berkmann\" />\r\t<meta name=\"generator\" content=\"proj.sh\" />\r\t<meta name=\"description\" content=\"\" />\r\t<meta name=\"keywords\" content=\"$1, \" />\r\t<meta name=\"copyrights\" content=\"Copyright (c) 2016 Maximilian Berkmann\" />\r\t<style type=\"text/css\">\r\t\t/*CSS*/\r\t</style>\r\t<script type=\"text/javascript\">\r\t\t//JS\r\t</script>\r</head>\r<body>\r<?php\r\t\r?>\r\t\r</body>\r</html>" > "$1".php
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		echo -e "<?php\r\t\r?>" > "$1".php
	fi
}

function Help {
	echo Makes a JavaScript file.
	echo "Usages: php [name] [|-e]"
	echo ""
	echo  "  -h, --help                  Display this help section."
	echo  "  -e, --essence               Creates a PHP script that will use Essence.php"
	echo  "  -c, --html                  Add HTML code."
	echo ""
	echo "To create a simple generic PHP file, type: php, to generate a script.php file."
}

php $1 $2