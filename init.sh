#!/bin/bash

# Arch-linux packages
if [ -e /bin/pacman ]; then
    sudo pacman -S tmux vim zsh
fi

#Syncs with github if needed
#rc Dotfiles
if [ ! -d $HOME/dotfile ]; then
    printf "Downloading dotfile\n"
    git clone https://github.com/michaeljo94/dotfile.git ~/dotfile
fi

#Vundel for vim
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    printf "Downloading Vundle for Vim\n"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#antigen for zsh
if [ ! -e $HOME/antigen/antigen.zsh ]; then
    printf "Downloading antigen for ZSh\n"
    git clone https://github.com/zsh-users/antigen.git ~/antigen
fi

#linking rc-files
function safelink {
   if [ ! -e $HOME/$1 ]; then
       ln -s $HOME/dotfile/$1 $HOME/$1
       echo $1 linked succesfully
   else
       echo $1 already exists
   fi
}
printf "Trying to link RunControl\n\n"
safelink .vimrc
safelink .tmux.conf
safelink .zshrc

#change shell to zsh
if [ $SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
  else
    printf "\nyou are alread using ZSh\n\n"
fi
