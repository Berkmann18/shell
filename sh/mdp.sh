#!/bin/bash
function mdp {
	if [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	elif [ "$1" == "-b" -o "$1" == "--browser" -o "$2" == "-b" -o "$2" == "--browser" ]; then
		mdp "$1" -s
		xdg-open "$1".html #sensible-browser "$1".html
		sleep 10
		rm "$1".html
	elif [ "$1" == "-s" -o "$1" == "--save" -o "$2" == "-s" -o "$2" == "--save" ]; then
		echo -e "<!DOCTYPE html>\n<html>\n<head>\n\t<title>$1</title>\n\t<link rel=\"stylesheet\" type=\"text/css\" href=\"${HOME}/Dropbox/Projects/EssenceJS/1.1/essence.css\" /></head>\n<body>\n\t" > "$1".html 
		markdown "$1".md >> "$1".html
		echo -e "\n</body>\n</html>" >> "$1".html
	else
		markdown "$1".md
	fi
	shift 2
}

function Help {
	echo Preview a markdown document
	echo -e "Usages: mdp [name] [-b|-s]\n"
	echo  "                              Display the html equivalent."
	echo  "  -h, --help                  Display this help section."
	echo  "  -b, --browser               Preview the HTML equivalent in the default browser."
	echo  "  -s, --save                  Save the HTML equivalent into a file."
}

mdp $1 $2 $3
