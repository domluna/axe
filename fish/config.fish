for F in $HOME/.config/fish/env/*
	source $F
end

set fish_greeting ""

#
# General stuff
#

set -x PATH /usr/local/anaconda3/bin $PATH
set -x GOPATH (go env GOPATH)
set -x PATH $PATH $GOPATH/bin
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH $HOME/julia/usr/bin $PATH

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

alias gst 'git status'
alias ga 'git add'
alias gc 'git commit'
alias bubu 'brew cleanup; brew prune; brew cask cleanup'
alias ll 'ls -larth'
alias md 'mkdir -p'

alias j julia
alias c clear
alias v nvim
alias vi nvim
alias vim nvim

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'


switch (uname)
case Linux
case Darwin
	set -x PYTHONPATH $HOME/github/FCND/udacidrone
	set -x JAVA_HOME /usr/libexec/java_home
case '*'
	echo 'OS not detected!'
end
