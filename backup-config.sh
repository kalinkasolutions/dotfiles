#!/bin/bash

mkdir config-files

rsync -av $HOME/.zshrc ./config-files
rsync -av $HOME/.zprofile ./config-files
rsync -av $HOME/.gitconfig ./config-files
rsync -av $HOME/.gitconfig-kalinkasolution ./config-files
rsync -av $HOME/.gitconfig-work ./config-files

mkdir -p config-files/.ssh/configs
rsync -av $HOME/.ssh/configs/ ./config-files/.ssh/configs/
rsync -av $HOME/.ssh/config ./config-files/.ssh

mkdir -p etc/{keyd,ssh}
rsync -av /etc/keyd/default.conf etc/keyd/default.conf
sudo rsync -av --chown=kalinka:kalinka /etc/ssh/sshd_config etc/ssh/sshd_config
