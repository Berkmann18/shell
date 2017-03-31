#!/bin/bash
crtDir=$PWD
function aI {
	
	if [ "$1" == "-t" -o "$2" == "-t" -o "$1" == "--tgz" -o "$2" == "--tgz" ]; then
		Setup $1
		if [ -e "$crtDir/$1.tar.gz" ]; then
			cp $crtDir/"$1.tar.gz" $PWD
		elif [ -e "$crtDir/$1.tgz" ]; then
			cp $crtDir/"$1.tgz" $PWD
		else
			echo "Wrong option for the file!"
		fi
		untgz "$1"
		rm "$1".*
	elif [ "$1" == "-z" -o "$2" == "-z" -o "$1" == "--zip" -o "$2" == "--zip" ]; then
		Setup $1
		unzip "$1"
		rm $1.zip
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		echo "Install an application"
		echo -e "Usage: appInstall [name] [-t|-z]\n"
		echo "  -h, --help                  Display this help section."
		echo "  -t, --tgz                   Install the app from the .tgz/.tar.gz file"
		echo "  -z, --zip                   Install the app from the .zip file"
	
	else
		echo "Only .tar.gz/.tgz/.zip files can be used for installation!"
		exit
	fi
}

function Setup {
	cd ~/Apps
	if [ ! -d "$1" ]; then
		mkdir "$1"
	fi
	cd "$1"
}

aI $1 $2