#!/bin/bash

install_packages() {
	read -r -p "\nInstall Docker & docker-compose? [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping Docker systemctl setup...\n"
	else
		echo -e "\nInstalling Docker for MacOS..."

		declare -a packages=(
			"docker"
			"docker-compose"
		)

		brew install ${packages[@]}
		brew cask install docker

		echo -e "DONE.\n"
	fi
}

setup_homebrew() {
	read -r -p "\nInstall Homebrew? [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping Docker systemctl setup...\n"
	else
		if [[ ! $(which brew) ]] && [[ ! $(brew --version &> /dev/null) ]]; then
			echo -e "\nCould not find existing HOMEBREW installation."
			echo -e "\nNow installing..."
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi
	fi
}


run_mc() {
	read -r -p "Start Mission Control container? [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping docker-compose up --build -d..."
	else
		echo -e "\nRunning Mission Control backend"
		cd ../ && \
		echo -e "\nSourcing .env"
		source sourceme.sh && \
		echo -e "\nStarting container..."
		docker-compose up --build -d
		echo
		echo -e "\nRun 'prisma deploy' & 'prisma seed' from"
		echo -e "\nthe root directory to get started"
	fi
}

setup_macos() {
	echo -e "\nSetting up MacOS config...\n"

	setup_homebrew
	install_packages
	run_mc
}

setup_macos
