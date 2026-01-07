#!/bin/bash

mkdir config-files

rsync -av $HOME/.zshrc ./config-files
rsync -av $HOME/.zprofile ./config-files
rsync -av $HOME/.gitconfig ./config-files
rsync -av $HOME/.gitconfig-kalinkasolution ./config-files
rsync -av $HOME/.gitconfig-work ./config-files

mkdir -p ./config-files/.config/{rofi,yazi}
rsync -av $HOME/.config/rofi ./config-files/.config/rofi
rsync -av $HOME/.config/yazi ./config-files/.config/yazi

mkdir -p ./config-files/.ssh/configs
rsync -av $HOME/.ssh/configs/ ./config-files/.ssh/configs/
rsync -av $HOME/.ssh/config ./config-files/.ssh

mkdir -p ./config-files/etc/{keyd,ssh}
rsync -av /etc/keyd/default.conf ./config-files/etc/keyd/default.conf
sudo rsync -av --chown=kalinka:kalinka /etc/ssh/sshd_config ./config-files/etc/ssh/sshd_config


