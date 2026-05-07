#!/bin/bash

iptables -F INPUT

PERMITTED_MACS="65:54:54:89:23:12 92:54:12:86:89:09 83:65:23:98:42:65"

for MAC in $PERMITTED_MACS
do
	iptables -A FORWARD -m mac --mac-source $MAC -j ACCEPT
	echo "$MAC permitted"
done

iptables -P FORWARD DROP
