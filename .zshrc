export ZSH_TMUX_AUTOSTART='true'
#export TERM='xterm-256color'
export EDITOR='vim'
source /home/michael/antigen/antigen.zsh
echo 'zsh initializing'
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle gpg-agent
antigen bundle ssh-agent
antigen bundle systemd
antigen bundle adb
#antigen bundle ubuntu
antigen bundle archlinux
antigen bundle git
antigen bundle heroku
antigen bundle history
antigen bundle pip
#antigen bundle command-not-found
antigen bundle tmuxinator
antigen bundle tmux
antigen bundle autojump
antigen bundle sudo
antigen bundle rsync
antigen bundle common-aliases
antigen bundle web-search

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle unixorn/autoupdate-antigen.zshplugin


# Completions
antigen bundle zsh-users/zsh-completions src  
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme agnoster
#antigen theme sporty_256
#antigen theme clean
#antigen theme jdavis/zsh-files themes/jdavis
#antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train
##antigen theme eli-oat/bashi

# Tell antigen that you're done.
antigen apply

alias dfh='df -h'
#powerline
#if [[ -r /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#        source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
#    fi
echo 'zsh complete'

#. /home/michael/.local/bin/powerline/bindings/zsh/powerline.zsh
