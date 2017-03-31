#!/bin/bash

bin32 $1
for i in $(objdump -d $1.x -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo
