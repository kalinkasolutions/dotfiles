#!/bin/bash

mkdir config-files

rsync -av $HOME/.zshrc ./config-files
rsync -av $HOME/.gitconfig ./config-files
rsync -av $HOME/.gitconfig-kalinkasolution ./config-files
rsync -av $HOME/.gitconfig-work ./config-files
