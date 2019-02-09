#!/usr/bin/env bash

# remove old files
rm ~/.config/nvim/init.vim
rm ~/.tmux.conf
rm ~/.gitconfig
rm ~/.bashrc
rm ~/.config/alacritty/alacritty.yml
rm ~/.julia/config/startup.jl
rm ~/.julia/config/startup_ijulia.jl

# symlinks

if [ "$(uname -s)" == "Darwin" ]
then
    echo "On MacOS ..."
    ln -s $PWD/bashrc ~/.bashrc
else
    echo "On Linux ...?"
    ln -s $PWD/bashrc_linux ~/.bashrc
fi
ln -s $PWD/init.vim ~/.config/nvim/init.vim
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/alacritty.yml ~/.config/alacritty/alacritty.yml
# ln -s $PWD/startup.jl ~/.julia/config/startup.jl
# ln -s $PWD/startup_ijulia.jl ~/.julia/config/startup_ijulia.jl

