#!/bin/bash
function js {
	if [ -z "$1" ]; then
		js script
	fi
	if [ "$1" == "-e" -o "$2" == "-e" -o "$1" == "--essence" -o "$2" == "--essence" ]; then
		echo -e "/**\r *@author Maximilian Berkmann\r *@description \r *@version 1.0\r *@license \r *@requires essence\r */\rfunction Init (stackLayer) {\r\tif (typeof Essence !== \"undefined\") {\r\t\t//code here\r\t} else if (stackLayer > 3) {\r\t\tconsole.log(\"Wow, hold on ! %d stack layers down !!\", stackLayer);\r\t\tsetTimeout(\"Init()\", 5);\r\t} else {\r\t\tconsole.warn(\"EssenceJS is not currently available !\");\r\t\tInit(stackLayer? stackLayer + 1: 1);\r\t}\r}" > "$1".js
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		echo -e "/**\r *@author Maximilian Berkmann\r *@description \r *@version 1.0\r *@license \r */\r\r" > "$1".js
	fi
}

function Help {
	echo Makes a JavaScript file.
	echo -e "Usages: js [name] [|-e]\n"
	echo "  -h, --help                  Display this help section."
	echo "  -e, --essence               Creates an EssenceJS 1.1+ script"
	echo -e "\nTo create a simple generic JavaScript file, type: js, to generate a script.js file."
}

js $1 $2
