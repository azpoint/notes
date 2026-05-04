#!/bin/bash
echo "Dropping packages from $1..."
iptables -I INPUT -s $1 -j DROP
echo "Tha packages from $1 will be dropped"
