# vim FTW
export EDITOR=vim
export VISUAL=vim

export PATH=~/bin:~/.rbenv/bin:/usr/local/share/npm/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

export LESS='-R'

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable bash completion for rbenv commands
source ~/.rbenv/completions/rbenv.bash
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

# This will set the title of the iTerm tab to the name of the current directory
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Git Shortcuts
alias gs='git status'
alias gcom='git co master'
alias gpp='git pull --rebase && git push'
alias shipit='git pull --rebase && git push && cap deploy'

# Source all files in .bash_profile.d
# These are meant to contain environemnt settings that I don't want in git
if [ -d .bash_profile.d ]; then
  for f in `ls -a .bash_profile.d | egrep '^\.\w'`; do
    source .bash_profile.d/$f
  done
fi
