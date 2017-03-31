#!/bin/bash
#source: https://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex by @a20
function p(){ #Find processes
        ps aux | grep -i $1 | grep -v grep
}

function ka(){ #kill all

    cnt=$( p $1 | wc -l)

    echo -e "\nSearching for '$1' -- Found" $cnt "Running Processes .. "
    p $1

    echo -e '\nTerminating' $cnt 'processes .. '
    ps aux  |  grep -i $1 |  grep -v grep   | awk '{print $2}' | xargs sudo kill -9
    echo -e "Done!\n"

    echo "Running search again:"
    p "$1"
    echo -e "\n"
}

ka $1
