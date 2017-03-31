#!/bin/bash

#Tools needed to reverse engineer a binary file:
# Disassembler, debugger, hex code editor, 
#1. disassemble($1.bin)=>$1.asm
#

mkdir re_$1
cp $1 re_$1/$1
cd re_$1
#Some info first
file $1 > $1.info
#Disassemble the program
objdump -d $1 > $1.asm
#Dump any global data
objdump -s -j .rodata $1 > $1.dat
#List required shared libraries
ldd $1 > $1_reqlibs.txt
#Now ASM->C/C++ ()
strings $1 > $1_ins.txt
asm2c $1 > $1.c
strace $1 > $1_sstrace.txt #(syscalls & signal trace)
ltrace $1 > $1_libtrace.txt #(library call trace)
#Probs try:
#for i in $(objdump -d $1 |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo
#ld
