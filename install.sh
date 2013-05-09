#!/bin/bash

for file in `ls -a | egrep '^\.\w'`; do
  if [[ $file != ".git" ]] && [[ $file != ".gitignore" ]] && [[ $file != ".gitmodules" ]]; then
    echo "~/$file -> ~/dotfiles/$file"
    ln -fns dotfiles/$file ~/$file
  fi
done
