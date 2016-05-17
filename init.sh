#!/bin/bash

StartPath=$PWD
VundlePath=$HOME/.vim/bundle/Vundle.vim
TpmPath=$HOME/.tmux/plugins/tpm
DotfilePath=$HOME/dotfile

function dep {
if [ -e /bin/pacman ]; then
    sudo pacman -Syu tmux vim zsh openssl yajl powerline powerline-fonts pydf wget curl --noconfirm 
fi
}

function jogurt {

    mkdir /tmp/$USER-yaourt
    cd /tmp/$USER-yaourt

    git clone https://aur.archlinux.org/package-query.git
    cd package-query
    makepkg -si --noconfirm
    cd ..
    git clone https://aur.archlinux.org/yaourt.git
    cd yaourt
    makepkg -si --noconfirm
    cd ..
    
    cd $StartPath
    rm -rf /tmp/$USER-yaourt

}

function dotrepo {
# Dotfile Repo

if [ ! -d $HOME/dotfile ]; then
    printf "Downloading dotfile\n"
    git clone https://github.com/michaeljo94/dotfile.git $DotfilePath 
fi
}

function vundle {
#Vundel for vim

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    printf "Downloading Vundle for Vim\n"
    git clone https://github.com/VundleVim/Vundle.vim.git $VundlePath
fi
}

function tpm {
#tmux plugin manager 

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    printf "Downloading Tmux plugin Manager\n"
    git clone https://github.com/tmux-plugins/tpm $TpmPath
fi
}

function safelinkd {

    if [ ! -d $HOME/$2 ]; then
        ln -s $1 $HOME/$2
        printf "%s linked succesfully" "$(basename $1)"
    else
        printf "%s already exists in %s" "$(basename $1)" "$2"
    fi
}

function safelink {

   if [ ! -e $HOME/$1 ]; then
       ln -s $HOME/dotfile/$1 $HOME/$1
       printf "%s linked succesfully\n" "$1"
   else
      printf "%s already exists\n" "$1"
   fi
}
function linking {

safelink .gitconfig
safelink .vimrc
safelink .tmux.conf
safelink .zshrc
safelinkd /usr/lib/python3.5/site-packages/powerline .local/bin/powerline
}

function update () {
     if [ -d $1 ]; then

        cd $1
        printf "NOTE: Checking %s ...\t" "$(basename $1)"
        git pull
        cd $StartPath

    else
        printf "%s does not exist" "$(basename $1)" "$2"
    fi
}

if [[ $EUID -eq 0 ]]; then
      echo "This script must NOT be run as root" 1>&2
        exit 1
    fi

case $1 in
    "install" )
        case $2 in 
            "all" )
                dep
                dotrepo
                vundel
                tpm
                linking
                if [ $SHELL != "/bin/zsh" ]; then
                    chsh -s /bin/zsh
                else
                    printf "you are alread using ZSh\n\n"
                fi
                ;;
            "vundle" )
                if [ -e /bin/pacman ]; then
    sudo pacman -Syu vim openssl powerline powerline-fonts git wget curl --noconfirm 
                fi
                vundle
                safelink .vimrc
                ;;
            "tpm" )
                if [ -e /bin/pacman ]; then
    sudo pacman -Syu tmux openssl powerline powerline-fonts git wget curl --noconfirm 
                fi
                tpm
                safelink .tmux.conf
                ;;
            "yaourt" )
                yaourt
            ;;
        esac
            ;;
    "update" )
        case $2 in 
            "all" )
                update $DotfilePath
                update $VundlePath
                update $TpmPath
                ;;
            "vundle" )
                update $VundlePath
                ;;
            "tpm" )
                update $TpmPath
                ;;
            "yaourt" )
                yaourt
            ;;
        esac

        ;;
    * )
        echo sounds like a bug not a feature
        ;;
esac
