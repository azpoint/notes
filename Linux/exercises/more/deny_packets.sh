#!/bin/bash
for ip in $(cat ips.txt)
do
	echo "Dropping packets from $ip"
	iptables -I INPUT -s $ip -j DROP
done
