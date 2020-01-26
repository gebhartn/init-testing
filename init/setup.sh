confirm() {
	read -r -p "Proceed with setup? [y/N]"
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
	"Linux"
	"Exit"
)

select opt in "${options[@]}"
do
	case $opt in
		"MacOS")
			confirm "macos"
			break
			;;
		"Linux")
			confirm "linux"
			break
			;;
		"Exit")
			echo "Stopping..."
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done
