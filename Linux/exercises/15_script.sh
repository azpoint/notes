#!/bin/bash

while true
do
	read -rp "Enter an integer between 0 to 100: " num


	if [[ "$num" -ge 0 && "$num" -le 100 ]]
	then
		for ((i=0; i<="$num"; i++))
		do
			touch "file_${i}_$(date +%M_%S).txt"
			echo "File created as file_${i}.txt"
			sleep 3
		done
	else
		echo "Invalid input."
	fi
done
