#!/bin/bash

rsync -av ./config-files/.zshrc $HOME/
rsync -av ./config-files/.zprofile $HOME/
rsync -av ./config-files/.gitconfig $HOME/
rsync -av ./config-files/.gitconfig-kalinkasolution $HOME/
rsync -av ./config-files/.gitconfig-work $HOME/

mkdir -p $HOME/.ssh/configs
rsync -av ./config-files/.ssh/configs/ $HOME/.ssh/configs/
rsync -av ./config-files/.ssh/config $HOME/.ssh

mkdir -p /etc/{keyd,ssh}
rsync -av etc/keyd/default.conf /etc/keyd/default.conf
sudo rsync -av chown=root:root chmod=600 etc/ssh/sshd_config /etc/ssh/ssh_config
