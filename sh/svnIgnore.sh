#!/bin/bash

if [ ! -e ".svnignore" ]; then
	touch .svnignore
fi
svn propset svn:ignore -F .svnignore .