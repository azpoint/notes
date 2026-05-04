#!/bin/bash
echo "Please provide the absolute path of the file: "
read file

if [[ -f $file ]]
then
	echo "Between which lines want to display the text?"
	read -rp "Start from: " start
	if [[ "$start" -ge 1 ]]
	then
		read -rp "Finish at: " end
		if [[ "$end" -ge "$start" ]]
		then
			sed -n "${start},${end}p" "$file"
		fi
	fi
else
	echo  "Invalid path or value."
fi
