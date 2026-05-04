#!/bin/bash
PS3="Choose an option: "

select choice in date_time list_users display_disk_usage quit
do
	case $choice in
		date_time) date +"%F %H:%M:%S" ;;
		list_users) who | awk '{print $1}' | sort -u ;;
		display_disk_usage) df -h ;;
		quit)
			echo "C ya bitch!"
			break
			;;
		*)
			echo "Invalid Option."
			;;
	esac
done
