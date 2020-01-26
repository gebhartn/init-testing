#!/bin/bash

confirm() {
	read -r -p "Proceed with setup? [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo "Cancelling setup"
		echo "Now exiting"
		exit
	else
		./"$1".sh
	fi
}

declare -a options=(
	"Configure for MacOS"
	"Configure for Ubuntu / Debian / CentOS / Fedora"
	"Configure for Arch"
	"Deploy Mission Control"
	"Exit"
)

COLUMNS=12

PS3="Please choose an option: "

select opt in "${options[@]}"
do
	case $opt in
		"Configure for MacOS")
			confirm "mac"
			break
			;;
		"Configure for Ubuntu / Debian / CentOS / Fedora")
			confirm "linux"
			break
			;;
		"Configure for Arch")
			confirm "arch"
			break
			;;
		"Deploy Mission Control")
			confirm "mc"
			break
			;;
		"Exit")
			echo "Stopping..."
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done
