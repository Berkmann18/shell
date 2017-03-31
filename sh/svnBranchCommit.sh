#!/bin/bash
#Commit the changes from an URL $1 to a branch URL $2
svn copy "${1}" ^/branches/"${2}"
svn switch ^/branches/"${2}"
svn commit -m "Updated from ${1}"