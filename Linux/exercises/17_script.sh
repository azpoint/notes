#!/bin/bash
read -rp "Provide the filepath: " ip_file

if [[ -f "$ip_file" ]]
then
	while read ip
	do
		echo -e "\n######################\n"
		ping -c 1 "$ip"
	done < "$ip_file"
fi
