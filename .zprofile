export EDITOR='code -w'
export VISUAL='code -w'

# my bin
PATH=~/bin

# Postgres
export PGHOME=/Applications/Postgres.app/Contents/Versions/latest
PATH+=:$PGHOME/bin

# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
PATH+=:${ANDROID_HOME}/tools
PATH+=:${ANDROID_HOME}/platform-tools

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Go Lang
export GOPATH=/usr/local/go
PATH+=:$GOPATH/bin

# Flutter
export FLUTTER_PATH=/usr/local/flutter
PATH+=:$FLUTTER_PATH/bin

# homebrew
PATH+=:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin

# unix
PATH+=:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# current directory bin
PATH+=:bin

export PATH

# Mise
eval "$(/Users/paul/.local/bin/mise activate zsh)"

# pretty colors
export LESS='-R'

# Enable zsh completion for git commands/branches
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

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
