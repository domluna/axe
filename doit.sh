#!/usr/bin/env bash

# remove old files
rm ~/.config/nvim/init.vim
rm ~/.config/nvim/coc-settings.json
rm ~/.tmux.conf
rm ~/.gitconfig
rm ~/.bashrc
rm ~/.zshrc
rm ~/.config/alacritty/alacritty.yml
rm ~/.julia/config/startup.jl
rm ~/.julia/config/startup_ijulia.jl

# symlinks

if [ "$(uname -s)" == "Darwin" ]
then
	echo "On MacOS ..."
	ln -s $PWD/bashrc ~/.bashrc
	ln -s $PWD/zshrc ~/.zshrc
	ln -s $PWD/alacritty.yml ~/.config/alacritty/alacritty.yml
else
	echo "On Linux ...?"
	ln -s $PWD/bashrc_linux ~/.bashrc
	ln -s $PWD/zshrc_linux ~/.zshrc
	ln -s $PWD/alacritty_linux.yml ~/.config/alacritty/alacritty.yml
fi
ln -s $PWD/init.vim ~/.config/nvim/init.vim
ln -s $PWD/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/startup.jl ~/.julia/config/startup.jl
ln -s $PWD/startup_ijulia.jl ~/.julia/config/startup_ijulia.jl

