#!/bin/bash

svn up
#svn checkout ^/trunk
svn merge ^/trunk
svn commit -m "Synced the current branch with the trunk"
svn up
svn merge --reintegrate ^/"${1}"
svn commit -m "Merged '${1}' into trunk!"
#svn delete ^/branches/"${1}" -m "Remove '${1}' branch, reintegrated with the trunk"