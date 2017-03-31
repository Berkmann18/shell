#!/bin/bash

if [ "$2" == "$(sha1sum $1)" ]; then
	echo "Correct"
else
	echo "Incorrect"
fi

sha1sum $1 > $1.sha1
sha1sum -c $1.sha1
rm $1.sha1