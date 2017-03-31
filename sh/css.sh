#!/bin/bash
function css {
	if [ -z "$1" ]; then
		echo "" > style.css
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		echo "" > "$1".css	
	fi
}


function Help {
	echo Makes a CSS stylesheet.
	echo "Usages: css [name]"
	echo ""
	echo  "  -h, --help                  Display this help section."
	echo ""
	echo "To create a simple generic CSS stylesheet, type: css, to generate a style.css stylesheet."
}


css $1