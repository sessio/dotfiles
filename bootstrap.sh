#!/bin/bash

MARKER="sessio.dotfiles-generated"
DOTSCRIPT="\$HOME/.bashrc.dotfiles"

function write_status {
echo "$(tput setaf 2)> $(tput setaf 4)$1$(tput sgr 0)"
}

function write_error {
echo "$(tput setaf 1)  ! $(tput setaf 5)$1$(tput sgr 0)"
}

function write_note {
echo "$(tput setaf 2)  * $(tput setaf 6)$1$(tput sgr 0)"
}

function ask_confirm {
while true; do
    read -p "$(tput setaf 2)> $(tput setaf 6)$1$(tput sgr 0) (y/n): " yn
    case $yn in
        [Yy]* ) result=yes; break;;
        [Nn]* ) result=no; break;;
        *) write_error "only y or n please";;
    esac
done
}

# sync this dir to home
write_status "Syncing dotfiles to $HOME"
rsync -q -av --no-perms --exclude .git --exclude bootstrap.sh --exclude scripts --exclude README.md --exclude global-conf . ~

# install Vundle
write_status "Install Vundle"
if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    write_error "skip, already installed"
else
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Vundle pluginInstall
write_status "Install Vim plugins (Vim may cry for .vimrc errors at this point, dont mind)"
vim +PluginInstall +qall

# Source .bashrc.dotfile in profile
write_status "Custom login script sourcing"
PROFILE="none"
if [ -f $HOME/.bash_profile ]; then 
    PROFILE=$HOME/.bash_profile;
elif [ -f $HOME/.profile ]; then
    PROFILE=$HOME/.profile;
fi
if [ $PROFILE != "none" ]; then
    write_note "Selected $PROFILE as login script"
    if grep -q "$MARKER" $PROFILE; then
        write_error "Skip, already has our sourcing line"
    else
        write_note "Appending a source oneliner"
        echo "[ -f \"$DOTSCRIPT\" ] && source $HOME/.bashrc.dotfiles; # ${MARKER}" >> $PROFILE
    fi
else
    write_error "No .bash_profile or .profile, add a 'source ~/.bashrc.dotfile' in your preferred profile script"
fi

# source custom bashrc now
write_status "Sourcing .bashrc.dotfiles now"
source ~/.bashrc.dotfiles

# checks
write_status "Doing some sanity checks for environment"

# locale set?
if [ -z $LANG ]; then 
    write_note "Locale not set in env, deal with that next"; 
fi

# install node.js?
if [ -z "`which node`" ]; then
    ask_confirm "node not found in path, do you want to install it now? (sudo rights required)"
    if [ $result = "yes" ]; then
        write_status "Installing node"
        sudo scripts/install-node-ppa.sh
    fi
fi

write_status "Done, enjoy!"
