#!/bin/bash
# while [[ $# -gt 1 ]]; do
# case "$1" in
#     A|a)
#     echo Scheduled for addition
#     shift
#     ;;
#     ""|" "|' ')
#     echo No modifications
#     shift
#     ;;
#     D|d)
#     echo Scheduled for deletion
#     shift
#     ;;
#     M|m)
#     echo Modified
#     shift
#     ;;
#     R|r)
#     echo Replaced
#     shift
#     ;;
#     C|c)
#     echo Conflicted
#     shift
#     ;;
#     X|x)
#     echo Present due to an external definition
#     shift
#     ;;
#     I|i)
#     echo Ignored
#     shift
#     ;;
#     ?|\?)
#     echo Not under VC
#     shift
#     ;;
#     !|\!)
#     echo Missing
#     shift
#     ;;
#     ~|\~)
#     echo "The type (file/dir/link) changed"
#     shift
#     ;;
#     *)
#     # unknown option
#     ;;
# esac
# shift # past argument or value
# done

#!/bin/bash


args=("$@")
for (( i = 0; i < ${#args[@]}; i++)); do
	if [ -z ${args[${i}]} ]; then
		echo No modifications
	elif [ "${args[${i}]}" == "A" ]; then
		echo Scheduled for addition
	elif [ "${args[${i}]}" == "D" ]; then
		echo Scheduled for deletion
	elif [ "${args[${i}]}" == "M" ]; then
		echo Modified
	elif [ "${args[${i}]}" == "R" ]; then
		echo Replaced
	elif [ "${args[${i}]}" == "C" ]; then
		echo Conflicted
	elif [ "${args[${i}]}" == "X" ]; then
		echo Present due to an external definition
	elif [ "${args[${i}]}" == "I" ]; then
		echo Ignored
	elif [ "${args[${i}]}" == "?" ]; then
		echo Not under SVN
	elif [ "${args[${i}]}" == "!" ]; then
		echo Missing
	elif [ "${args[${i}]}" == "~" ]; then
		echo "The type (file/dir/link) changed"
	fi
done