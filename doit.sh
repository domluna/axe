#!/usr/bin/env bash

# remove old files
rm ~/.config/nvim/init.vim
rm ~/.tmux.conf
rm ~/.gitconfig
rm ~/.bashrc

ln -s $PWD/init.vim ~/.config/nvim/init.vim
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/bashrc ~/.bashrc
