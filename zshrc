# Antigen
# =======

# source $HOME/.antigen/antigen.zsh
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
# antigen bundle brew
# antigen bundle brew-cask
# antigen bundle bundler
# antigen bundle command-not-found    # requires 'brew tap homebrew/command-not-found'
# antigen bundle docker
# antigen bundle docker-compose
# antigen bundle heroku
# antigen bundle git
# antigen bundle node
# antigen bundle npm
# antigen bundle node
# antigen bundle nvm
# antigen bundle gem
# antigen bundle osx
# antigen bundle rails
# antigen bundle ruby
# antigen bundle rvm

# Bundles from non-default repos
# antigen bundle unixorn/docker-helpers.zshplugin
# antigen bundle zsh-users/zsh-syntax-highlighting

# Custom theme
# antigen theme $HOME/dotfiles/ steeef_custom.zsh-theme

# Tell antigen that you're done.
# antigen apply

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef_custom"		
		
plugins=(brew bundler docker docker-compose heroku git npm node gem osx rails ruby rvm)		
		
source $ZSH/oh-my-zsh.sh

# User configuration
# ==================

# enable 256 color support
export TERM=xterm-256color

# the most annoying environment variable ever
export PATH=$PATH:/usr/local/bin:/usr/local/opt:/usr/bin:/bin:/usr/sbin:/sbin

export DEVDIR=$HOME/Development

# unbreak utf-8 issues
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# history
export HISTSIZE=100000
export HISTFILE=$HOME/.history
export SAVEHIST=$HISTSIZE # This will save history for next sessions

export EDITOR=vim

# rvm
export PATH=$PATH:$HOME/.rvm/bin

# nvm
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# pip cache packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Docker Machine
# eval "$(docker-machine env default)"

# added by travis gem
[ -f /Users/mikey/.travis/travis.sh ] && source /Users/mikey/.travis/travis.sh

# gcloud path
source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# gcloud autocomplete
source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# awscli autocomplete
source /usr/local/share/zsh/site-functions/_aws


# Aliases
# =======

alias dev='cd $HOME/Development'
