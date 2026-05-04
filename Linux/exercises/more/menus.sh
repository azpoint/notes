#!/bin/bash
PS3="Choose your country: "
select COUNTRY in Germany France USA SPAIN Quit
do
	case $REPLY in
	1)
		echo "You speak German."
		;;
	2)
		echo "you Speak French."
		;;
	3)
		echo "You speak English."
		;;
	4)
		echo "You speak Spanish."
		;;
	5)
		break
		;;
	*)
		echo "Invalid option."
		;;
	esac
done
