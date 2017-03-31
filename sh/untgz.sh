#!/bin/bash
if [[ -e "$1.tar.gz" ]]; then
	tar -xvzf "$1".tar.gz
else
	tar -xvzf "$1".tgz
fi