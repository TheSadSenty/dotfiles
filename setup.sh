#! /bin/bash

cd $(dirname "$0")

sudo pacman --needed --noconfirm -Syy git gcc clang \
	fish fisher btop curl ca-certificates jq fzf \
	rustup docker docker-compose stow unzip nodejs npm neovim \
	bat cmake make patch lazygit go ripgrep luarocks \
	jdk21-openjdk jdk17-openjdk ruby lua51 tree-sitter nerd-font \
	php composer keepassxc uv fd tmux grep dmidecode python3

if uname -r | grep --invert-match "WSL"; then
	sudo pacman --needed --noconfirm -Syy i3 xorg xorg-xinit rofi xclip keepassxc alacritty xdotool maim ly
fi

if ! id "sentyyy" &>/dev/null; then
	echo "User 'sentyyy' does not exist. Creating user..."
	sudo useradd -m sentyyy
	echo "User 'sentyyy' created successfully."
else
	echo "User 'sentyyy' already exists."
fi

echo "Adding user 'sentyyy' to docker groups..."
sudo usermod -aG docker sentyyy
echo "User 'sentyyy' added to docker groups."

if sudo dmidecode -s system-product-name | grep -qi "VirtualBox"; then
	echo "System is running inside VirtualBox. Adding user 'sentyyy' to vboxsf group..."
	sudo usermod -aG vboxsf sentyyy
	echo "User 'sentyyy' added to vboxsf group."
else
	echo "System is not running inside VirtualBox. Skipping vboxsf group addition."
fi

# echo "Creating a basic folder structure"
# mkdir ~/projects/
# mkdir ~/tmp/

# echo "Installing PatrickF1/fzf.fish"
# /usr/bin/fish fisher install PatrickF1/fzf.fish

echo "Stow folders"
stow .

echo "Starting SSH agent"
systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service

echo "Starting Docker daemon"
sudo systemctl enable docker.service
sudo systemctl start docker.service
