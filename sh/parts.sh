#!/bin/bash  
lsblk -o NAME,LABEL,FSTYPE,TYPE,SIZE,MOUNTPOINT,STATE,MODEL,MODE > partitionInfo.txt