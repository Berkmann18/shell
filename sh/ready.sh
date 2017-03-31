#!/bin/bash
if [ -n "$1" ]; then
	if [ ! -x "$1.sh" ]; then
		chmod +x $1.sh
	fi
	cp $1.sh $DB/Script/bin
	mv $DB/Script/bin/$1.sh $DB/Script/bin/$1
else
	exit 0
fi
