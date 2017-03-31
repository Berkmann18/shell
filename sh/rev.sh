#!/bin/bash
function rev {
	if [ -z "$1" ]; then
		rev review Title
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	elif [ "$1" == "-m" -o "$1" == "--markdown" -o "$2" == "-m" -o "$2" == "--markdown" -o "$3" == "-m" -o "$3" == "--markdown" ]; then
		echo -e "#Review of: $2 ($1)\r\r\t##Layout:\r\r\t##Features:\r\r\t##Page speed:\r\r\t##Issues:\r\r\t##Suggestions:\r\r" > "review_$1".md
	else
		echo -e "Review of: $2 ($1)\r\t\r\tLayout:\r\t\r\tFeatures:\r\t\r\tPage speed:\r\t\r\tIssues:\r\t\r\tSuggestions:\r\t\r" > "review_$1".txt
	fi
}


function Help {
	echo Makes a website/webapp review report.
	echo "Usages: rev [title] [url] [-m]"
	echo ""
	echo  "  -h, --help                  Display this help section."
	echo  "  -m, --markdown              Display the review in a Markdown format."
	echo ""
	echo "To create a simple generic review report, type: rev, to generate a review.txt report."
}


rev $1 $2 $3