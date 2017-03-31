#!/bin/bash

gcc -m32 -o $1 $1.c
chmod u+x $1
./$1
