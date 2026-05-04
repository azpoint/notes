#!/bin/bash
read -p  "String 1: " str1
read -p  "String 2: " str2

if [ "$str1" = "$str2" ]
then
	echo "The strings are equal."
else
	echo "The strings are not equal."
fi

if [[ "$str1" == "$str2" ]]
then
	echo "The strings are equal."
else
	echo "The strings are not equal."
fi

if [[ "$str1" != "$str2" ]];then
echo "The strings are NOT equal."
fi
