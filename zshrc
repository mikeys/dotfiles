# Antigen
# =======

source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle brew
antigen bundle brew-cask
antigen bundle bundler
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle unixorn/docker-helpers.zshplugin
antigen bundle heroku
antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle node
antigen bundle nvm
antigen bundle gem
antigen bundle osx
antigen bundle rails
antigen bundle ruby
antigen bundle rvm
antigen bundle zsh-users/zsh-syntax-highlighting

# Custom theme
antigen theme $HOME/dotfiles/ steeef_custom.zsh-theme

# Tell antigen that you're done.
antigen apply


# User configuration
# ==================

# Enable 256 color support
export TERM=xterm-256color

# The most annoying environment variable ever
export PATH=$PATH:/usr/local/bin:/usr/local/opt:/usr/bin:/bin:/usr/sbin:/sbin

# Unbreak annoying UTF-8 issues
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Unbreak history
export HISTSIZE=100000
export HISTFILE=$HOME/.history
export SAVEHIST=$HISTSIZE # This will save history for next sessions

export EDITOR=vim

# RVM
export PATH=$PATH:$HOME/.rvm/bin

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# GVM
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Android NDK
export NDK=$HOME/Development/android/android-ndk-r9d

# Python
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Docker Machine
eval "$(docker-machine env default)"

# added by travis gem
[ -f /Users/mikey/.travis/travis.sh ] && source /Users/mikey/.travis/travis.sh

# Modifies PATH to include gcloud.
source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# The next line enables zsh auto-completion for gcloud.
source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# The next line enables zsh auto-completion for awscli.
source /usr/local/share/zsh/site-functions/_aws


# Aliases
# =======

alias dev='cd $HOME/Development'
