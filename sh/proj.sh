#!/bin/bash
function site {
	mkdir $1
	cd $1
	mkdir rsc
	html index $1 -e
	cd rsc
	js script
	css style
}

function app {
	mkdir $1
	cd $1
	mkdir rsc bin
	html index $1 -e
	cd rsc
	js script
	css style
}

function framework {
	if [ -z "$2"]; then
		framework $1 js
	fi
	mkdir $1
	cd $1
	mkdir modules docs examples
	touch README.md LICENSE FORK.md TODO.md
	touch main."$2"
}

function html {
	if [ -z "$1"]; then
		html index
	fi
	if [ "$2" == "-e" ]; then
		echo "<!DOCTYPE html>\r<html>\r<head>\r\t<title>$1</title>\r\t<meta charset=\"UTF-8\" />\r\t<meta name=\"author\" content=\"Maximilian Berkmann\" />\r\t<meta name=\"generator\" content=\"proj.sh\" />\r\t<meta name=\"description\" content=\"\" />\r\t<meta name=\"keywords\" content=\"$1, \" />\r\t<meta name=\"copyrights\" content=\"Copyright (c) 2016 Maximilian Berkmann\" />\r\t<link rel=\"stylesheet\" type=\"text/css\" href=\"rsc/style.css\" />\r\t<script type=\"text/javascript\" src=\"rsc/script.js\"></script>\r</head>\r<body>\r\t\r</body>\r</html>" > "$1".html
	elif [ "$2" == "-$" ]; then
		echo "<!DOCTYPE html>\r<html>\r<head>\r\t<title>$1</title>\r\t<meta charset=\"UTF-8\" />\r\t<meta name=\"author\" content=\"Maximilian Berkmann\" />\r\t<meta name=\"generator\" content=\"proj.sh\" />\r\t<meta name=\"pragma\" content=\"no-cache\" />\r\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\r\t<meta name=\"description\" content=\"\" />\r\t<meta name=\"keywords\" content=\"$1, \" />\r\t<meta name=\"copyrights\" content=\"Copyright (c) 2016 Maximilian Berkmann\" />\r\t<link rel=\"stylesheet\" type=\"text/css\" href=\"rsc/style.css\" />\r\t<script type=\"text/javascript\" src=\"pathto/essence.js\"></script>\r\t<script type=\"text/javascript\" src=\"rsc/script.js\"></script>\r</head>\r<body onpageshow=\"Init()\">\r\t\r</body>\r</html>" > "$1".html
	else
		echo "<!DOCTYPE html>\r<html>\r<head>\r\t<title>$1</title>\r\t<meta charset=\"UTF-8\" />\r\t<meta name=\"author\" content=\"Maximilian Berkmann\" />\r\t<meta name=\"generator\" content=\"proj.sh\" />\r\t<meta name=\"description\" content=\"\" />\r\t<meta name=\"keywords\" content=\"$1, \" />\r\t<meta name=\"copyrights\" content=\"Copyright (c) 2016 Maximilian Berkmann\" />\r\t<style type=\"text/css\">\r\t\t/*CSS*/\r\r</style>\r\t<script type=\"text/javascript\">\r\t\t//JS\r\t</script>\r</head>\r<body>\r\t\r</body>\r</html>" > "$1".html
	fi
}

function js {
	if [ -z "$1"]; then
		js script
	fi
	if [ "$2" == "-e" ]; then
		echo "function Init\(stackLayer) {\r\tif (typeof Essence !== "undefined") {\r\t\t//code here\r\t} else if (stackLayer > 3) {\r\t\tconsole.log("Wow, hold on ! %d stack layers down !!", stackLayer);\r\t\tsetTimeout("Init()", 5);\r\t} else {\r\t\tconsole.warn("EssenceJS is not currently available !");\r\t\tInit(stackLayer? stackLayer + 1: 1);\r\t}\r}" > "$1".js
	else
		touch "$1".js
	fi
}

if [ "$1" == "site" ]; then
	site $2
elif [ "$1" == "app" ]; then
	app $2
elif [ "$1" == "framework" ]; then
	framework $2 $3
else
	echo "usage: proj [site|app] name\nproj framework name extension\n\n\tsite\tWebsite\n\tapp\tWeb application\n\tframework\tFramework\n\tname\tName of the project\n\textension\tExtension of the files in the framework (default: js for JavaScript)"	
fi