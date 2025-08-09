#!/bin/bash
set -x

current=$(hostname)
if [[ "$current" != *.kalinka.lan ]]; then
    sudo hostnamectl set-hostname "${current}.kalinka.lan"
fi

sudo timedatectl set-timezone Europe/Zurich

if [ -f /etc/debian_version ]; then
    sudo apt update && sudo apt install -y zsh freeipa-client sssd-tools chrony
elif [ -f /etc/redhat-release ]; then
    sudo dnf install -y zsh freeipa-client sssd-tools || sudo yum install -y zsh freeipa-client sssd-tools chrony
elif [ -f /etc/arch-release ]; then
    sudo pacman -Sy --noconfirm zsh freeipa-client sssd chrony
else
    echo "Unsupported OS. Please install zsh manually."
    exit 1
fi

sudo apt install chrony
sudo systemctl enable --now chronyd

# Install oh-my-zsh non-interactively
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download .zshrc and place it in home
curl -fsSL https://raw.githubusercontent.com/kalinkasolutions/dotfiles/refs/heads/master/config-files/.zshrc -o "$HOME/.zshrc"

# Change default shell to zsh for the user
chsh -s "$(which zsh)" "$(whoami)"

echo "PasswordAuthentication no
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem   sftp    /usr/lib/openssh/sftp-server

PubkeyAuthentication yes
KerberosAuthentication yes
GSSAPIAuthentication yes
UsePAM yes
ChallengeResponseAuthentication no

AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys
AuthorizedKeysCommandUser root
" | sudo tee /etc/ssh/sshd_config

sudo apt update
sudo apt install freeipa-client
sudo apt install sssd-tools

sudo ipa-client-install \
  --mkhomedir \
  --domain=kalinka.lan \
  --server=ipa.kalinka.lan \
  --realm=KALINKA.LAN

