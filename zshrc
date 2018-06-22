# Antigen
# =======

source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle brew
antigen bundle brew-cask
antigen bundle bundler
antigen bundle docker
antigen bundle docker-compose
antigen bundle heroku
antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle nvm
antigen bundle gem
antigen bundle osx
antigen bundle rails
antigen bundle ruby
antigen bundle rvm

# Bundles from non-default repos
antigen bundle unixorn/docker-helpers.zshplugin
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle lukechilds/zsh-better-npm-completion

# Custom theme
antigen theme $HOME/dotfiles/ steeef_custom.zsh-theme

# Tell antigen that you're done.
antigen apply

# export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="steeef_custom"

# plugins=(brew bundler docker docker-compose heroku git npm node gem osx rails)
# plugins+=(ruby rvm zsh-completions zsh-syntax-highlighting)
# autoload -U compinit && compinit

# source $ZSH/oh-my-zsh.sh


# User configuration
# ==================

# enable 256 color support
if [ "$TERM" = "xterm" ]; then
	export TERM=xterm-256color
fi

# the most annoying environment variable ever
export PATH=$PATH:/usr/local/bin:/usr/local/opt:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

export DEVDIR=$HOME/Development

# unbreak utf-8 issues
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# history
export HISTSIZE=100000
export HISTFILE=$HOME/.history
export SAVEHIST=$HISTSIZE # This will save history for next sessions

export EDITOR=nvim

# nvm
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh --no-use

# gvm
# [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOPATH=${HOME}/dev/go
export GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export GOROOT=$(brew --prefix)/Cellar/go/${GOVERSION}/libexec
export PATH=${GOPATH}/bin:$PATH

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

# python
# export VIRTUAL_ENV_DISABLE_PROMPT=true
export VIRTUAL_ENV_DISABLE_PROMPT='1'

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=false

# pip cache packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# php
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# docker
# eval "$(docker-machine env default)"

# travis ci
# [ -f /Users/mikey/.travis/travis.sh ] && source /Users/mikey/.travis/travis.sh

# gcloud path
# source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# gcloud autocomplete
# source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# awscli completions
source '/usr/local/share/zsh/site-functions/_aws'

# Aliases
# =======
alias ctags="$(brew --prefix)/bin/ctags"
alias dev='cd $DEVDIR'
alias dockerclean='docker rm -v $(docker ps -a -q -f status=exited)'
alias vim='nvim'
alias ag="ag --path-to-agignore $HOME/dotfiles/agignore"

# Load private configurations
source "$HOME/.zshrc.local"

export PATH="$HOME/.yarn/bin:$PATH"
