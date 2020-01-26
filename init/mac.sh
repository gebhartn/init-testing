#!/bin/bash

install_packages() {
	echo -e "\nInstalling Docker for MacOS..."

	declare -a packages=(
		"docker"
		"docker-compose"
	)

	brew install ${packages[@]}

	echo -e "DONE.\n"
}

setup_homebrew() {
	if [[ ! $(which brew) ]] && [[ ! $(brew --version &> /dev/null) ]]; then
		echo -e "\nCould not find existing HOMEBREW installation."
		echo -e "\nNow installing..."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
}

setup_macos() {
	echo -e "\nSetting up MacOS config...\n"

	setup_homebrew
	install_packages

	echo -e "DONE.\n"
}

setup_macos
