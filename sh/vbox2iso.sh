#!/bin/bash
function vi {
	if [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		VBoxManage internalcommands converttoraw "$1".vdi "$1".img
		if [ -e "$1".iso ]; then
			sudo dd if="$1".iso of="$2"
		else
			sudo dd if="$1".img of="$2"
		fi
	fi
}

function Help {
	echo Makes a JavaScript file.
	echo -e "Usages: vbox2iso [name] [drive]\n"
	echo "  name                        Name of the VBox (.vdi file)"
	echo "  drive                       Name of the drive (e.g: /dev/sdc)"
	echo "  -h, --help                  Display this help section."
}

vi $1 $2