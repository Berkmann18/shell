#!/bin/bash

echo -e "\tSuper Parameter checker"

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -t|--title)
    title="$2"
    shift # past argument
    ;;
    -v|--version)
    version="$2"
    shift # past argument
    ;;
    -h|--help)
    help="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

echo "Title=$title"
echo "Version=$version"
echo "Help on $help"
echo "Default ? $default"