#!/usr/bin/env bash

if [ -z $@ ]
then
	echo "Logout"
	echo "Reboot"
	echo "Shutdown"
else
    option=$@

	case $option in
		Logout)
			i3-msg exit
			;;
		Reboot)
			systemctl reboot
			;;
		Shutdown)
			systemctl poweroff
			;;
		*)
			;;
	esac
fi
