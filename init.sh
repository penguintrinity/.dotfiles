#!/bin/bash

##     MICHAEL's RC-init
#
# michaeljohann94@outlook.com
#
##

#Syncs with github if needed

#rc Dotfiles
if [ ! -d $HOME/dotfile ]; then
git clone https://github.com/michaeljo94/dotfile.git ~/dotfile
fi

#Vundel for vim
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#antigen for zsh
if [ ! -e $HOME/antigen/antigen.zsh ]; then 
git clone https://github.com/zsh-users/antigen.git ~/antigen
fi

#linking rc-files
#tmux.conf
if [ ! -e $HOME/.tmux.conf ]; then
    ln -s $HOME/dotfile/.tmux.conf $HOME/.tmux.conf
fi

#zshrc
if [ ! -e $HOME/.zshrc ]; then
    ln -s $HOME/dotfile/.zshrc $HOME/.zshrc
fi

#vimrc
if [ ! -e $HOME/.vim ]; then
    ln -s $HOME/dotfile/.vimrc $HOME/.vimrc
fi


