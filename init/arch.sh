#!/bin/bash

install_packages() {
	echo -e "\nInstalling required packages for Arch..."

	declare -a packages=(
	"docker"
	"docker-compose"
)

sudo pacman -Syu ${packages[@]}

echo -e "DONE.\n"
}

enable_docker() {
	read -r -p "Start and enable Docker? [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping Docker systemctl setup...\n"
	else
		echo -e "\nStarting Docker through systemctl..."
		systemctl start docker

		echo -e "\nEnabling Docker through systemctl..."
		systemctl enable docker

		echo -e "DONE.\n"
	fi
}

configure_docker() {
	read -r -p "Manage Docker as a non-root user? [y/N] " answer
	if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
		echo -e "\nSkipping Docker non-root configuration...\n"
	else
		echo -e "\nAdding 'docker' group..."
		sudo groupadd docker

		echo -e "\nAdding user $USER to 'docker' group..."
		sudo usermod -aG docker "$USER"

		echo -e "DONE.\n"
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

install_packages
enable_docker
configure_docker
run_mc
