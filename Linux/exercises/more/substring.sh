#!/bin/bash
str1="Nowadays, Linux powers the servers of the internet."

if [[ "$str1" == *"linux"* ]]
then
	echo "The substring Linux is there."
else
	echo "The substring Linux is not there."
fi
