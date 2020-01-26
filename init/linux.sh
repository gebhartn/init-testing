#!/bin/bash

get_docker() {
	sh ./get-docker.sh
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

get_docker
enable_docker
configure_docker
