# cool stuff bucko
export PS1="λ \W: "

export GO111MODULE=on

export EDITOR=nvim

alias j1='julia'
alias cat='bat'
alias tree='ls --tree'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# alias vim='nvim'
# alias vi='nvim'
# alias v='nvim'
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
