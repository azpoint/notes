#!/bin/bash
read -rp "Enter Y or N: " char

char=${char,,}

if [[ "$char" = "y" ]]
then
	echo "\"YES!\""
elif [[ "$char" = "n" ]]
then
	echo "\"NO!\""
else
	echo "Please enter exact either option."
	exit 1
fi
