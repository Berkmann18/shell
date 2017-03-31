#!/bin/bash
Title=""
width=600
height=400
args=("$@")
keyPressed=0
class=0
resizable=0
t=0

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -s|--size)
    width="$2"
    if [[ $3 =~ '^[0-9]+$' ]]; then #if $3 is a number
    	height="$3"
	fi
    shift
    ;;
    -T|--title)
    Title="$2"
    shift
    ;;
    -c|--class)
    class=1
    shift
    ;;
    -r|--resizable)
    resizable=1
    shift
    ;;
    -k|--keyPressed)
    Help
    shift
    ;;
    -t|--test)
    t=1
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift # past argument or value
done
if [ $class -eq 1 ]; then
	echo -e "class $1 {\r\t\r\t$1 () {\r\t\t\r\t}\r\t\r\tpublic String toString () {\r\t\treturn \"$1(''=)\";\r\t}\r}" > "$1".pde
elif [ $t -eq 1 ]; then
	echo -e "void setup () {\r\tsize($width, $height);\r\tbackground(255);\r\tsmooth();\r}\r\r$1 obj = new $1();\rvoid draw () {\r\t\r\tprintln(obj.toString());\r}" > "$1".pde	
else
	echo -e "void setup () {\r\tsize($width, $height);\r\tbackground(255);\r\tsmooth();\r}\r\rvoid draw () {\r\t\r}" > "$1".pde
fi

if [ $keyPressed -eq 1]; then
	echo -e "void keyPressed () {\r\tif (key == CODED) {\r\t\tif (keyCode == ) doStuff;\r\t} else if (key == '' || keyCode == ) doStuff;\r}" >> "$1".pde
fi
if [ $resizable -eq 1 -o -z $Title ]; then
	echo -e "void settings () {" >> "$1".pde
	if [ $resizable -eq 1 ]; then echo -e "\r\tframe.setResizable(true);" >> "$1".pde; fi
	if [ -n $Title ]; then
		echo -e "\r\tframe.setTitle($Title);" >> "$1".pde
	fi
	echo -e "\r}" >> "$1".pde
fi