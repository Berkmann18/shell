#!/bin/bash
function c {
	if [ -z "$1" ]; then
		c main
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		echo -e "#include <stdio.h>\r\rint main() {\r\t\r\treturn 0;\r}" > "$1".c
	fi
}

function Help {
	echo Makes a c script.
	echo "Usages: c [name]"
	echo ""
	echo  "  -h, --help                  Display this help section."
	echo ""
	echo "To create a simple generic c script, type: c, to generate a main.c script."
}

c $1
