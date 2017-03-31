#!/bin/bash
#default PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"

#Examples:
#Server: [\d \t \u@\h:\w ] $
#Styling: \[\xxx[yy;zzm\] or \[\xxx[zzm\]
#xxx:
#yy: 00 (normal), 01 (light bold), 02 (bold), 03 (italic), 04 (underline), 07 (highlighted), 09 (stricked)
#zz: 0 (W), 1 (bold), 2, (grey), 3 (italic), 4 (underline), 7 (highlighted), 9 (stricked)
# 30 (invisible grey), 31 (R), 32 (G), 33 (Gold), 34 (B), 35 (M), 36 (C), 37 (S)
# 40 (W on invisible grey) 41 (W on R), 42 (W on G), 43 (W on Gold), 44 (W on B), 45 (W on M), 46 (W on C), 47 (W on S)

function psX {
	if [ -n "$2" ]; then
		P="$2"	
		if [ -n "$1" ]; then
			UD="$1"
		elif [ "$1" == "-h" -o "$1" == "--help" ]; then
			Help
		elif [ "$1" == "-p" -o "$1" == "--path" ]; then
			PS1="${debian_chroot:+($debian_chroot)}\[\033[01;34m\]${P}\[\033[00m\]\$"
			return
		elif [ "$1" == "-u" -o "$1" == "--user" ]; then
			PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]${UD}\[\033[00m\]\$"
			return
		else
			UD="\u@\h"
		fi
	else
		P="\w"
	fi
	PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]${UD}\[\033[00m\]:\[\033[01;34m\]${P}\[\033[00m\]\$"
}

function Help {
	echo Change the prompt
	echo -e "Usages: psX [user] [path]\n"
	echo "  -h, --help                  Display this help section."
	echo "  -p, --path                  Display the path on prompt."
	echo "  -u, --user                  Display the path on user@domain."
}

psX $1 $2 $3