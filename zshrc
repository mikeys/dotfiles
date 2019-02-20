# Antigen
# =======

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git

antigen bundle mafredri/zsh-async
antigen bundle rupa/z
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# These should be last
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

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

export EDITOR=code

# nvm
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh --no-use

# golang
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
alias ag="ag --path-to-agignore $HOME/dotfiles/agignore"

# Load private configurations
source "$HOME/.zshrc.local"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
