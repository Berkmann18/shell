#!/bin/bash
function shell {
	if [ "$1" == "-f" -o "$2" == "-f" -o "$1" == "--function" -o "$2" == "--function" ]; then
		cp $SHDIR/shell.sh "$1".sh
		sed -i 's/shell/${1}/g' "$1".sh
	elif [ "$1" == "-c" -o "$2" == "-c" -o "$1" == "--command" -o "$2" == "--command" ]; then
		cp $SHDIR/template.txt "$1".sh
		sed -i 's/shell/${1}/g' "$1".sh
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		echo "Makes a Bash script (.sh)."
		echo -e "Usage: shell [name] [-c|-f]\n"
		echo "  -h, --help                  Display this help section."
		echo "  -c, --command               Structure the bash script as a bash command (e.g: js.sh)"
		echo "  -f, --function              Structure the bash script as a functional script (e.g: pde.sh)"
	else
		echo "#!/bin/bash" > "$1".sh
		echo "" >> "$1".sh
	fi
}

shell $1 $2
chmod u+x "$1".sh
