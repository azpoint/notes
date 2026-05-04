#!/bin/bash
read -rp "How many files? " num

for ((i=1; i<="$num"; i++))
do
	touch "file_${i}.txt"
done

echo "done!"
