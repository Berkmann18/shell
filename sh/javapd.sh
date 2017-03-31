#!/bin/bash
echo "Decompiling project classes..."
~/Apps/Jad/./jad -o -r -sjava -dsrc '$1/**/*.class'