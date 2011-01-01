#!/bin/bash

red () {
  echo -e "\033[1;31m$1\033[0m"
}

green () {
  echo -e "\033[1;32m$1\033[0m"
}

green "Pulling down git submodules for vim plugins"
git submodule init
git submodule update

green "Backing up existing configuration files to $HOME/.vimbackup/"
mv ~/.vim ~/.vimbackup || (red "~/.vim not found, nothing to backup. Creating empty ~/.vimbackup" && mkdir ~/.vimbackup)
mv ~/.vimrc ~/.vimbackup/ || red "~/.vimrc not found, nothing to backup"
mv ~/.gvimrc ~/.vimbackup/ || red "~/.gvimrc not found, nothing to backup"

green "Installing new vim configuration files"
ln -s $PWD ~/.vim
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc
