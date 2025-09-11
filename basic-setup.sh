#!/bin/bash
set -x

sudo timedatectl set-timezone Europe/Zurich

if [ -f /etc/debian_version ]; then
    sudo apt update && sudo apt install -y git zsh freeipa-client sssd-tools chrony bat
elif [ -f /etc/redhat-release ]; then
    sudo dnf install -y git zsh freeipa-client sssd-tools bat || sudo yum install -y git zsh freeipa-client sssd-tools chrony bat
elif [ -f /etc/arch-release ]; then
    sudo pacman -Sy --noconfirm git zsh freeipa-client sssd chrony bat
else
    echo "Unsupported OS. Please install zsh manually."
    exit 1
fi

sudo systemctl enable --now chronyd

# Install oh-my-zsh non-interactively
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download .zshrc and place it in home
curl -fsSL https://raw.githubusercontent.com/kalinkasolutions/dotfiles/refs/heads/master/config-files/.zshrc -o "$HOME/.zshrc"

# Change default shell to zsh for the user
chsh -s "$(which zsh)" "$(whoami)"
