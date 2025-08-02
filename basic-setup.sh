#!/bin/bash
set -x

if command -v zsh >/dev/null 2>&1; then
    echo "Zsh is already installed."
else
    echo "Zsh is not installed. Attempting to install..."

    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y zsh
    elif [ -f /etc/redhat-release ]; then
        sudo dnf install -y zsh || sudo yum install -y zsh
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Sy --noconfirm zsh
    elif [ "$(uname)" = "Darwin" ]; then
        if command -v brew >/dev/null 2>&1; then
            brew install zsh
        else
            echo "Homebrew not found. Please install Homebrew first."
            exit 1
        fi
    else
        echo "Unsupported OS. Please install zsh manually."
        exit 1
    fi
fi


# Install oh-my-zsh non-interactively
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download .zshrc and place it in home
curl -fsSL https://raw.githubusercontent.com/kalinkasolutions/dotfiles/refs/heads/master/config-files/.zshrc -o "$HOME/.zshrc"

# Change default shell to zsh for the user
chsh -s "$(which zsh)" "$(whoami)"
