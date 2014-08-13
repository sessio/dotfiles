#!/bin/bash

MARKER="sessio.dotfiles-generated"
DOTSCRIPT="$HOME/.bashrc.dotfiles"

# sync this dir to home
echo "> Syncing dotfiles to $HOME"
rsync -q -av --no-perms --exclude .git --exclude bootstrap.sh --exclude scripts --exclude README.md --exclude global-conf . ~

# install Vundle
echo "> Install Vundle"
if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "  ! skip, already installed"
else
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "> Install Vim plugins (Vim may cry for .vimrc errors at this point, dont mind)"
vim +PluginInstall +qall

echo "> Append custom bash script to .profile"
if grep -q "$MARKER" ~/.profile; then
    echo "  ! skip, marker already present"
else
    echo "if [ -f \"$DOTSCRIPT\" ]; then source $DOTSCRIPT; fí # ${MARKER}" >> ~/.profile
fi

echo "> Sourcing .bashrc.dotfiles"
source ~/.bashrc.dotfiles

echo
echo "> Done, enjoy!"
