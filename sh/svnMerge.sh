#!/bin/bash
#This script is mainly for CS2800

svn up
#svn checkout ^/"${1}"
svn merge ^/${1}
svn commit -m "Synced the current branch with the ${1}"
svn up
svn merge --reintegrate ^/"${1}"
svn commit -m "Merged '${1}' into . branch!"
#remove branch once done
#svn delete ^/branches/"${1}" -m "Remove ${1} branch, reintegrated with the . branch"