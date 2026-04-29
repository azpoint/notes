# Switch Examples

```bash
#!/bin/bash

if [[ $# != 2 ]]
then
	echo "The script requires 2 arguments. Signal and PID."
	exit
fi

case "$1" in
	1)
		echo "Sending the SIGHUP signal to $2"
		kill -SIGHUP $2
		;;
	2)	echo "Sending the SIGINT signal to $2"
		kill -SIGINT $2
		;;
	15)
		echo "Sending the SIGTERM signal to $2"
		kill -15 2
		;;
	*)
		echo "Signal number $1 will not be delivered"
		;;
esac

```
---
```bash
#!/bin/bash
PS3="Your choice:"
select ITEM in "Add User" "List All Processes" "Kill Process" "Install Program" "Quit"
do
if [[ $REPLY = 1 ]]
then
	read -p "Enter the username:" username
	output="$(grep -w $username /etc/passwd)"
	if [[ -n "$output" ]]
	then
		echo "The username $usernam already exists."
	else
		sudo useradd -m -s /bin/bash "$username"
		if [[ $? = 0 ]]
		then
			echo "The user was added successfully."
			tail -n 1 /etc/passwd
		else
			echo "there was an error adding the user."
		fi
	fi
elif [[ $REPLY = 2 ]]
then
	echo "Listing all processes..."
	sleep 1
	ps -f
elif [[ $REPLY  = 3 ]]
then
	read -p "Enter the process to kill:" process
	pkill $process
elif [[ $REPLY = 4 ]]
then
	read -p "Enter the program to install:" app
	sudo apt update && sudo apt install $app
elif [[ $REPLY = 5 ]]
then
	echo "Bye!"
	sleep 1
	exit
else
	echo "Invalid option."
fi
done

```
