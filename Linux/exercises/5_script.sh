#!/bin/bash
if [[ -f "$1" ]]
then
	echo "" > $1
	echo "Content cleared!"
else
	echo "The argument must be a file."
fi
