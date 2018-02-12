#!/usr/bin/env bash

# remove old files
rm ~/.config/nvim/init.vim
rm -rf ~/.config/fish
rm ~/.tmux.conf
rm ~/.gitconfig

ln -s init.vim ~/.config/nvim/init.vim
ln -s tmux.conf ~/.tmux.conf
ln -s gitconfig ~/.gitconfig
ln -s fish ~/.config/fish
