# General settings
export EDITOR='vim'
export PAGER='less'
export HISTCONTROL='ignoreboth'
export HISTSIZE='1000'
export HISTFILE="${HOME}/.bash_history"
export HISTFILESIZE='5000'

# Application settings
export PYENV_ROOT="${HOME}/.pyenv"
export HOMEBREW_CASK_OPTS='--appdir=~/Applications'
export PIP_REQUIRE_VIRTUALENV=true

# BASH specific
bashpath="$(command -v bash)" && export SHELL="${bashpath}"
userbashrc="${HOME}/.bashrc"

# Misc
localbin="${HOME}/.local/bin"
liquidprompt="${HOME}/.liquidprompt/liquidprompt"

# Fix MacOS path oddities for Tmux
if [ -f '/etc/profile' ] ; then
    unset PATH
    source /etc/profile
fi

# Load .bashrc if exists;macOS normally ignores
[ -f "${userbashrc}" ] && source "${userbashrc}"

# Add personal bin to path
if [ -d "${localbin}" ] && [[ ! "${PATH}" =~ ${localbin} ]] ; then
    PATH="${localbin}:${PATH}"
fi

# Only load items below here for interactive shells
[[ $- = *i* ]] || return

# Load liquidprompt
source "${liquidprompt}"
