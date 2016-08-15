export EDITOR='subl -w'
export VISUAL='subl -w'

# my bin
PATH=~/bin

# rbenv
PATH+=:~/.rbenv/bin

export PGHOME=/Applications/Postgres.app/Contents/Versions/9.5
PATH+=:$PGHOME/bin

# Go Lang
export GOPATH=$HOME/go
PATH+=:$GOPATH/bin

# heroku
PATH+=:/usr/local/heroku/bin

# homebrew
PATH+=:/usr/local/bin:/usr/local/sbin

# unix
PATH+=:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# current directory bin
PATH+=:bin

export PATH

export ANDROID_HOME=/usr/local/opt/android-sdk

# pretty colors
export LESS='-R'

# Enable bash completion for git commands/branches
source /usr/local/etc/bash_completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  printf $rbenv_ruby_version
}

# Colors for prompt
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[1;37m\]"
BLACK="\[\033[0;30m\]"
OFF="\[\033[0m\]"

# Colorized prompt with rbenv version, git branch and current directory
export PS1="$RED\$(__rbenv_ps1) $GREEN\w$YELLOW\$(__git_ps1 "[%s]")$OFF \$ "

# This will make the history file keep everything, http://superuser.com/a/664061
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history

# This will set the title of the iTerm tab to the name of the current directory
export PROMPT_COMMAND='history -a; echo -ne "\033]0;${PWD##*/}\007"'

# Git Shortcuts
alias gs='git status '
alias gcom='git checkout master'
alias bunl='bundle'

# Source all files in .bash_profile.d
# These are meant to contain environment settings that I don't want in git
if [ -d .bash_profile.d ]; then
  for f in `ls -a .bash_profile.d | egrep '\.sh$'`; do
    source .bash_profile.d/$f
  done
fi
