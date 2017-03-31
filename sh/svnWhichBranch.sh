#!/bin/bash
#svn info | grep '^URL:' | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$'
svn info | grep 'URL:'
svn info | grep 'Root Path:'