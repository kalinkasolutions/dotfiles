#!/bin/bash

mkdir config-files

rsync -av ./config-files/.zshrc $HOME/
rsync -av ./config-files/.zprofile $HOME/
rsync -av ./config-files/.gitconfig $HOME/
rsync -av ./config-files/.gitconfig-kalinkasolution $HOME/
rsync -av ./config-files/.gitconfig-work $HOME/
