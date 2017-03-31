#!/bin/bash

echo -e "\tParameter checker"

# store arguments in a special array 
args=("$@")
# get number of elements 
elements=${#args[@]}
 
# echo each element in array  
# for loop 
for (( i = 0; i < $elements ;  i++)); do 
    echo $i: ${args[${i}]} 
done