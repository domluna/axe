# cool stuff bucko
export PS1="λ \W: "

export TERM=xterm-256color

export PATH=/usr/local/conda/bin:$PATH

# Go
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$PATH:/Applications/Julia-1.1.app/Contents/Resources/julia/bin/"
export PATH=$PATH:$HOME/.pulumi//bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/julia/usr/bin
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin

 export GO111MODULE=on

# export JAVA_HOME=$(/usr/libexec/java_home)

export EDITOR=nvim

alias j1='julia'
alias ls='exa'
alias cat='bat'
alias tree='ls --tree'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias jn=$HOME/julia/usr/bin/julia
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias md='mkdir -p'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": nvim $(fzf);'

tm() {
 [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
 if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
 fi
 session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}


# direnv
eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/bash_completion/alacritty ] && source ~/.bash_completion/alacritty
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
