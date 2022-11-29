#!/bin/bash

for file in `ls -a | egrep '^\.\w'`; do
  if [[ $file != ".git" ]] && [[ $file != ".gitmodules" ]]; then
    echo "~/$file -> ~/dotfiles/$file"
    ln -fns dotfiles/$file ~/$file
  fi
done

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
