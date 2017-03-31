#!/bin/bash 
 
l=1
while (( "$#" )); do 
  echo -e "#$l: $1" 
  ((l++))
  shift 
done