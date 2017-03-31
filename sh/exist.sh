#!/bin/bash
function exist {
	if [ -a "$1" ]; then
		echo "It exists!"
	else
		echo "It doesn't exists!"
	fi
	if [ -d "$1" ]; then
		echo "Directory: yes"
	else
		echo "Directory: no"
	fi
	if [[ -e "$1" ]]; then
		echo "File: yes"
	else
		echo "File: no"
	fi
	if [ -r "$1" ]; then
		echo "Readable: yes"
	else
		echo "Readable: no"
	fi
	if [ -s "$1" ]; then
		echo "Empty: no"
	else
		echo "Empty: yes"
	fi
	if [ -w "$1" ]; then
		echo "Writable: yes"
	else
		echo "Writable: no"
	fi
	if [ -x "$1" ]; then
		echo "Executable: yes"
	else
		echo "Executable: no"
	fi
	if [ -O "$1" ]; then
		echo "Owned by you: yes"
	else
		echo "Owned by you: no"
	fi
	if [ -G "$1" ]; then
		echo "Owned by your group: yes"
	else
		echo "Owned by your group: no"
	fi
	if [ -N "$1" ]; then
		echo "Updated: yes"
	else
		echo "Updated: no"
	fi
}

exist $1