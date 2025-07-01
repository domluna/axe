#!/usr/bin/env bash

# remove old files
rm -rf $HOME/.config/nvim/
rm $HOME/.tmux.conf
rm $HOME/.gitconfig
rm $HOME/.bashrc
rm $HOME/.zshrc
rm $HOME/.config/kitty/kitty.conf
rm $HOME/.julia/config/startup.jl
rm $HOME/.config/ghostty/config

# symlinks

mkdir -p $HOME/.config/nvim/{lua,vim,lsp}
mkdir -p $HOME/.julia/config
mkdir -p $HOME/.config/kitty

if [ "$(uname -s)" == "Darwin" ]
then
	echo "On MacOS ..."
	ln -s $PWD/zshrc $HOME/.zshrc
else
	echo "On Linux ...?"
	ln -s $PWD/bashrc_linux $HOME/.bashrc
	ln -s $PWD/zshrc_linux $HOME/.zshrc
fi
ln -s $PWD/init.lua $HOME/.config/nvim/init.lua
ln -s $PWD/.stylua.toml $HOME/.config/nvim/stylua.toml
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/startup.jl $HOME/.julia/config/startup.jl
ln -s $PWD/lua/*.lua $HOME/.config/nvim/lua/
ln -s $PWD/lsp/* $HOME/.config/nvim/lsp/
ln -s $PWD/vim/* $HOME/.config/nvim/vim/
ln -s $PWD/kitty.conf $HOME/.config/kitty/kitty.conf
ln -s $PWD/ghostty_config $HOME/.config/ghostty/config
