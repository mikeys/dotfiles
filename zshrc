# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef_custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler brew git gem osx rails ruby)

source $ZSH/oh-my-zsh.sh

# User configuration

# The most annoying environment variable ever
# export PATH=/usr/local/bin:/usr/local/opt:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/opt:/usr/bin:/bin:/usr/sbin:/sbin

# Unbreak annoying UTF-8 issues
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE # This will save history for next sessions

export EDITOR=vim

# Aliases
alias gettaxi='cd $HOME/Development/gettaxi'
alias work='cd $HOME/Development/gettaxi/gtforge_server'

# RVM
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source "$HOME/.rvm/scripts/rvm"

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Android NDK
export NDK=$HOME/Development/android/android-ndk-r9d

# Python
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Golang
export GOPATH=$HOME/Development/go
export PATH=$PATH:$GOPATH/bin
alias setgopath='export GOPATH=$(pwd); echo ''GOPATH=$GOPATH'''

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Boot2docker
# $(boot2docker shellinit 2>/dev/null)

# Docker Machine
eval $(docker-machine env dev)

# added by travis gem
[ -f /Users/mikey/.travis/travis.sh ] && source /Users/mikey/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# The next line enables bash completion for awscli.
source /usr/local/share/zsh/site-functions/_aws
