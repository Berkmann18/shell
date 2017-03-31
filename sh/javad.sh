#!/bin/bash

~/Apps/Jad/./jad -sjava "$1".class
#to decompile an entire project folders: jad -o -r -sjava -dsrc '$1/**/*.class'