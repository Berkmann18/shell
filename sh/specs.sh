#!/bin/bash
function specs {
	if [ "$1" == "-b" -o "$1" == "--base" ]; then
		lsb_release -a
	elif [ "$1" == "-p" -o "$1" == "--partitions" ]; then
		sudo lsblk -o NAME,FSTYPE,LABEL,PARTLABEL,PARTFLAGS,MODEL,SIZE,TYPE,VENDOR
	elif [ "$1" == "-c" -o "$1" == "--cpu" ]; then
		cat /proc/cpuinfo
	elif [ "$1" == "-m" -o "$1" == "--memory" ]; then
		free
		cat /proc/memnfo
	elif [ "$1" == "-k" -o "$1" == "--kernel" ]; then
		echo "Kernel information: $(uname -a)"
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	else
		sudo lshw
	fi
}

function Help {
	echo Show the specs of the system.
	echo "Usages: specs [-b|-p]"
	echo ""
	echo  "  -h, --help                  Display this help section."
	echo  "  -b, --base                  Display the Linux Standard Base"
	echo  "  -p, --partitions            Display the partitions"
	echo  "                              Display the hardware' specs."
	echo  "  -k, --kernel                Dsiplay the kernel's information"
	echo ""
}

specs $1 $2