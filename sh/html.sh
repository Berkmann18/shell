#!/bin/bash
function html {
	if [ -z "$1" ]; then
		html index
	fi
	if [ "$1" == "-e" -o "$1" == "--extern" -o "$2" == "-e" -o "$2" == "--extern" ]; then
		echo -e "<!DOCTYPE html>\r<html lang=\"en\">\r<head>\r\t<title>$1</title>\r\t<meta charset=\"UTF-8\" />\r\t<meta name=\"author\" content=\"Maximilian Berkmann\" />\r\t<meta name=\"generator\" content=\"html.sh\" />\r\t<meta name=\"description\" content=\"\" />\r\t<meta name=\"keywords\" content=\"$1, \" />\r\t<meta name=\"copyrights\" content=\"Copyright (c) 2016 Maximilian Berkmann\" />\r\t<link rel=\"stylesheet\" type=\"text/css\" href=\"rsc/style.css\" />\r\t<script type=\"text/javascript\" src=\"rsc/script.js\"></script>\r</head>\r<body>\r\t\r</body>\r</html>" > "$1".html
	elif [ "$1" == "-$" -o "$1" == "--essence" -o "$2" == "-$" -o "$2" == "--essence" ]; then
		echo -e "<!DOCTYPE html>\r<html lang=\"en\">\r<head>\r\t<title>$1</title>\r\t<meta charset=\"UTF-8\" />\r\t<meta name=\"author\" content=\"Maximilian Berkmann\" />\r\t<meta name=\"generator\" content=\"html.sh\" />\r\t<meta name=\"pragma\" content=\"no-cache\" />\r\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\r\t<meta name=\"description\" content=\"\" />\r\t<meta name=\"keywords\" content=\"$1, \" />\r\t<meta name=\"copyrights\" content=\"Copyright (c) 2016 Maximilian Berkmann\" />\r\t<link rel=\"stylesheet\" type=\"text/css\" href=\"rsc/style.css\" />\r\t<script type=\"text/javascript\" src=\"pathto/essence.js\"></script>\r\t<script type=\"text/javascript\" src=\"rsc/script.js\"></script>\r</head>\r<body onpageshow=\"Init()\">\r\t\r</body>\r</html>" > "$1".html
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		echo -e "<!DOCTYPE html>\r<html lang=\"en\">\r<head>\r\t<title>$1</title>\r\t<meta charset=\"UTF-8\" />\r\t<meta name=\"author\" content=\"Maximilian Berkmann\" />\r\t<meta name=\"generator\" content=\"html.sh\" />\r\t<meta name=\"description\" content=\"\" />\r\t<meta name=\"keywords\" content=\"$1, \" />\r\t<meta name=\"copyrights\" content=\"Copyright (c) 2016 Maximilian Berkmann\" />\r\t<style type=\"text/css\">\r\t\t/*CSS*/\r\t</style>\r\t<script type=\"text/javascript\">\r\t\t//JS\r\t</script>\r</head>\r<body>\r\t\r</body>\r</html>" > "$1".html
	fi
}

function Help {
	echo Makes an HTML document.
	echo "Usages: html [name] [|-e|-$]"
	echo ""
	echo  "  -h, --help                  Display this help section."
	echo  "  -e, --extern                Creates an HTML document with external resources"
	echo  "  -$, --essence               Creates an HTML document that will use EssenceJS 1.1+"
	echo ""
	echo "To create a simple generic HTML document, type: html, to generate an index.html document."
}

html $1 $2
rm .html
