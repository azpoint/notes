#!/bin/bash
read -p "Enter your age: " age

if [[ $age -lt 18 ]] && [[ $age -ge 0 ]]
then
	echo "You are a minor..."
elif [[ $age -eq 18 ]]
then
	echo "You are just a recent major..."
elif [[ $age -gt 18 ]] && [[ $age -le 140 ]]
then
	echo "You can do some other stuff now..."
else
	echo "Fake, unless you are inmortal"
fi
