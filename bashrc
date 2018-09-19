# cool stuff bucko
export PS1="λ \W: "

export PATH=/usr/local/anaconda3/bin:$PATH

# Go
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$PATH:$HOME/.pulumi//bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/julia/usr/bin

# export JAVA_HOME=$(/usr/libexec/java_home)

export PYTHON=/usr/local/anaconda3/bin/python
export EDITOR=nvim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias j='julia'
alias jm=$HOME/julia/usr/bin/julia
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias bubu='brew cleanup; brew prune;'
alias ll='ls -larth'
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
