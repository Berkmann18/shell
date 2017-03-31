#!/bin/bash
function dsk {
	cd /usr/share/applications #~/.local/share/applications
	if [ "$2" == "-j" -o "$2" == "--java" ]; then
		echo "[Desktop Entry]" > "$1".desktop
		echo "Version=1.0" >> "$1".desktop
		echo "Name=$1" >> "$1".desktop
		echo "GenericName=" >> "$1".desktop
		echo "Comment=$1" >> "$1".desktop
		echo "Exec=${HOME}/Apps/$1/$1.sh" >> "$1".desktop
		#echo "Path=${HOME}/Apps/$1/" >> "$1".desktop
		echo "Icon=${HOME}/Apps/$1/$1.png" >> "$1".desktop
		echo "Terminal=true" >> "$1".desktop
		echo "Type=Application" >> "$1".desktop
		echo "Categories=Application;Utilities" >> "$1".desktop
		echo "StartupNotify=true" >> "$1".desktop
		echo "StartupWMClass=$1" >> "$1".desktop
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		echo "[Desktop Entry]" > "$1".desktop
		echo "Version=1.0" >> "$1".desktop
		echo "Name=$1" >> "$1".desktop
		echo "GenericName=" >> "$1".desktop
		echo "Comment=$1" >> "$1".desktop
		echo "Exec=${HOME}/Apps/$1/$1.sh" >> "$1".desktop
		#echo "Path=${HOME}/Apps/$1/" >> "$1".desktop
		echo "Icon=${HOME}/Apps/$1/$1.png" >> "$1".desktop
		echo "Terminal=true" >> "$1".desktop
		echo "Type=Application" >> "$1".desktop
		echo "Categories=Application;Utilities" >> "$1".desktop
		echo "StartupNotify=true" >> "$1".desktop
	fi
	if [ "$2" == "-a" -o "$2" == "--action" -o "$3" == "-a" -o "$3" == "--action" ]; then
		echo -e "Actions=MyAct;\n\n[Desktop Action MyAct]" >> "$1".desktop
		echo "Name=Do Thing\nExec=${HOME}/Apps/$1/$1.sh -a" >> "$1".desktop
		echo "OnlyShowIn=Unity;" >> "$1".desktop
	fi
	sudo nano "$1".desktop
}

function Help {
	echo "Make a desktop entry for a file (shell by default)."
	echo -e "Usages: dsk [name] [-j|-a]\n"
	echo  "  -h, --help                  Display this help section."
	echo  "  -j, --java                  Specify that the file is a java class"
	echo  "  -a, --action                Add an action"
	echo -e "\nDon't forget to desktop-file-validate it."
}

dsk $1 $2
