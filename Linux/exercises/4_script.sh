#!/bin/bash
if [[ $# = 1 ]]
then
	if [[ -f "$1" ]]
	then
		echo "Argument is a file."
	elif [[ -d "$1" ]]
	then
		echo "Argument is a dir."
	else
		echo "Argument $1 is neither a dir or directory."
	fi
else
	echo "Script must be run with exactly one argument."
fi
