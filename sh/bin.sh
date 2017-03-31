#!/bin/bash

nasm -f elf64 -o $1.o $1.asm #probs remove '64'
ld -o $1 $1.o
