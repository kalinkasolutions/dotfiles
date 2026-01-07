#!/bin/bash

rsync -av ./config-files/.zshrc $HOME/
rsync -av ./config-files/.zprofile $HOME/
rsync -av ./config-files/.gitconfig $HOME/
rsync -av ./config-files/.gitconfig-kalinkasolution $HOME/
rsync -av ./config-files/.gitconfig-work $HOME/

mkdir -p $HOME/.ssh/configs
rsync -av ./config-files/.ssh/configs/ $HOME/.ssh/configs/
rsync -av ./config-files/.ssh/config $HOME/.ssh

mkdir -p $HOME/.config/{rofi,yazi}
rsync -av ./config-files/.config/rofi $HOME/.config/rofi
rsync -av ./config-files/.config/yazi $HOME/.config/yazi

rsync -av ./config-files/etc/keyd/default.conf /etc/keyd/default.conf
