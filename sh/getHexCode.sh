#!/bin/bash

echo "" > $1.hex

for i in $(objdump -d $1 |grep "^ " |cut -f2)
	do echo -n '\x'$i >> $1.hex
done
echo