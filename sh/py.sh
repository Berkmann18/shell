#!/bin/bash
if [ "$1" == "-h" -o "$1" == "--help" ]; then
	echo "Makes a Python script (.py)."
	echo -e "Usage: py [name] [version]\n"
	echo "  -h, --help                  Display this help section."
	echo "  version                     Indicate the Python version to work with (optional)"
else
	if [ -z "$2" ]; then
		echo "#!/usr/bin/python" > "$1".py
	else
		echo "#!/usr/bin/python$2" > "$1".py
	fi
	echo "" >> "$1".py
fi

chmod u+x "$1".py
