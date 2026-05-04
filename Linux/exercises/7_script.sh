#!/bin/bash

date_time=$(date +%F\ %H:%M)

{
echo "$date_time"
echo "------------------------"
who | awk '{print $1}' | sort -u
echo
} >> logged_users.txt
