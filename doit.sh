#!/usr/bin/env bash

# remove old files
rm -rf $HOME/.config/nvim/
rm -rf $HOME/.config/starship.toml
rm $HOME/.tmux.conf
rm $HOME/.gitconfig
rm $HOME/.bashrc
rm $HOME/.zshrc
rm $HOME/.config/kitty/kitty.conf
rm $HOME/.julia/config/startup.jl

# symlinks

mkdir -p $HOME/.config/nvim/{lua,vim}
mkdir -p $HOME/.julia/config
mkdir -p $HOME/.config/kitty

if [ "$(uname -s)" == "Darwin" ]
then
	echo "On MacOS ..."
	ln -s $PWD/bashrc ~/.bashrc
	ln -s $PWD/zshrc $HOME/.zshrc
else
	echo "On Linux ...?"
	ln -s $PWD/bashrc_linux $HOME/.bashrc
	ln -s $PWD/zshrc_linux $HOME/.zshrc
fi
ln -s $PWD/init.vim $HOME/.config/nvim/init.vim
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/startup.jl $HOME/.julia/config/startup.jl
ln -s $PWD/lua/*.lua $HOME/.config/nvim/lua/
ln -s $PWD/vim/* $HOME/.config/nvim/vim/
ln -s $PWD/kitty.conf $HOME/.config/kitty/kitty.conf
