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
