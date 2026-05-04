#!/bin/bash
read -rp "Enter the user name: " user_name
read -rp "Enter the group name: " group_name

groupadd "$group_name"

useradd -s /bin/bash -m -G "$group_name" "$user_name"

echo -e "\n###############\n"

echo "Verify user addition: "

tail -n 2 /etc/passwd
echo
echo "Verify group addition: "

tail -n 2 /etc/group
echo
