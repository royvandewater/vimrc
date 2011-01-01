#!/bin/bash

echo "Pulling down git submodules for vim plugins"
git submodule init
git submodule update

echo "Backing up existing configuration files to $HOME/.vimbackup/"
mv ~/.vim ~/.vimbackup || echo "~/.vim not found, nothing to backup. Creating empty ~/.vimbackup" && mkdir ~/.vimbackup
mv ~/.vimrc ~/.vimbackup/ || echo "~/.vimrc not found, nothing to backup"
mv ~/.gvimrc ~/.vimbackup/ || echo "~/.gvimrc not found, nothing to backup"

echo "Installing new vim configuration files"
ln -s $PWD ~/.vim
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc
