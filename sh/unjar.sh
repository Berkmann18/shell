#!/bin/bash
mkdir "$1"
mv "$1".jar "$1"
cd "$1"
jar -xf "$1".jar
cd -