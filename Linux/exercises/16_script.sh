#!/bin/bash

for ip in $@
do
	ping -c 1 "$ip"
	echo "###############"
done
