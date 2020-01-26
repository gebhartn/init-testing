#!/bin/bash

confirm() {
	read -r -p "Proceed with setup? [y/N]" answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo "Cancelling setup"
		echo "Now exiting"
		exit
	else
		./"$1".sh
	fi
}

declare -a options=(
	"MacOS"
	"Ubuntu / Debian / CentOS / Fedora"
	"Arch"
	"Exit"
)

COLUMNS=12

PS3="Please choose an option: "

select opt in "${options[@]}"
do
	case $opt in
		"MacOS")
			confirm "mac"
			break
			;;
		"Ubuntu / Debian / CentOS / Fedora")
			confirm "linux"
			break
			;;
		"Arch")
			confirm "arch"
			break
			;;
		"Exit")
			echo "Stopping..."
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done
