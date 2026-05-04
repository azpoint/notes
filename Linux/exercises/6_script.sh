#!/bin/bash

#read -rp "Enter the IP address to DROP: " ip

if [[ "$1" = "-d" ]]
then
	iptables -I INPUT -s "$2" -j DROP
	echo "Packets from $2 will be dropped."
elif [[ "$1" = "-a" ]]
then
	iptables -I INPUT -s "$2" -j ACCEPT
	echo "Packets from $2 will be allow."
else
	echo "Must provide a valid flag. Either -d for drop or -a for allow packages."
fi

