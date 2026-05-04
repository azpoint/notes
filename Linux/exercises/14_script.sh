#!/bin/bash

while true
do
	read -rp "Enter an integer between 0 to 100: " num


	if [[ "$num" -ge 0 && "$num" -le 100 ]]
	then
		touch "file_${num}.txt"
		echo "File created as file_${num}.txt"
	else
		echo "Invalid input."
	fi
done
