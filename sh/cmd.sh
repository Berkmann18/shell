#!/bin/bash

cmd=""

while [[ $# -gt 1 ]]
do
key="$1"
title="Terminal"
new=0
folder=$PWD

case $key in
    -h|--help)
    Help
    shift
    ;;
    -n|--new)
    new=1
    shift
    ;;
    -t|--title)
    title="$2"
    shift
    ;;
    -e|--exec)
    cmd="$2"
    shift
    ;;
    -d|--directory)
    folder="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift # past argument or value
done
if [[ $new -eq 0 ]]; then
	xdotool key ctrl+shift+t -e "bash -c \"title ${title}; $cmd; exec bash\"" --working-directory=$folder
else
	gnome-terminal -e "bash -c \"title ${title}; $cmd; exec bash\"" --working-directory=$folder
fi

function Help {
	echo Open/manage a terminal.
	echo -e "Usages: cmd [-n] [-t title] [-e command] [-d directory]\n"
	echo "  -h, --help                  Display this help section."
	echo "  -n, --new                   Opens a new terminal (in an other window)"
	echo "  -t, --title                 Set the title of the new terminal"
	echo "  -e, --exec                  Execute a command on the new the terminal"
	echo "  -d, --directory             Change the working directory of the new terminal"
	echo "  no args                     Opens a new terminal in a new tab"
    exit
}
