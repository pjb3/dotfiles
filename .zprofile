export EDITOR='code -w'
export VISUAL='code -w'

# my bin
PATH=~/bin

# rbenv
PATH+=:~/.rbenv/bin

# pyenv
PATH+=:~/.pyenv/shims

# Postgres
export PGHOME=/Applications/Postgres.app/Contents/Versions/latest
PATH+=:$PGHOME/bin

# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
PATH+=:${ANDROID_HOME}/tools
PATH+=:${ANDROID_HOME}/platform-tools

# Go Lang
export GOPATH=$HOME/go
PATH+=:$GOPATH/bin

# Node
export NODE_PATH="/usr/local/lib/node_modules"
PATH+=:$NODE_PATH

# homebrew
PATH+=:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin

# unix
PATH+=:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# current directory bin
PATH+=:bin

export PATH

# pretty colors
export LESS='-R'

# Enable zsh completion for git commands/branches
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# A bunch of random stuff you need to get rbenv to work on M1 macs
# https://stackoverflow.com/a/69012677
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"
export optflags="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# This will make the history file keep everything, http://superuser.com/a/664061
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history

# This will set the title of the iTerm tab to the name of the current directory
export PROMPT_COMMAND='history -a; echo -ne "\033]0;${PWD##*/}\007"'

# Will make Elixir console (iex) remember history
export ERL_AFLAGS="-kernel shell_history enabled"

# Git Shortcuts
alias gs='git status '
alias gcom='git checkout main'
alias bunl='bundle'
alias gb='git --no-pager branch -l --sort=committerdate'

export PGDATABASE=spark_dev

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
