#!/bin/bash

# sync this dir to home
rsync -av --no-perms --exclude .git --exclude bootstrap.sh --exclude scripts --exclude README.md --exclude global-conf . ~

# install Vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

source ~/.bashrc
