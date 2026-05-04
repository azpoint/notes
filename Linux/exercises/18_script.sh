#!/bin/bash

for file in $2/*.$1
do
	echo "Copying $file to $3"
	sleep
	cp $file $3
done
