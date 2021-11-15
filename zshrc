export ZSH="/Users/domluna/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git tmux fd)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/anaconda3/bin:$PATH

# Go
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/julia/usr/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

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
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias md='mkdir -p'

export FZF_DEFAULT_OPTS='--height 96% --reverse --inline-info --preview "cat {}"'
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude '{.git,node_modules,vendor}/'"

bindkey -s '\C-p' 'nvim $(fzf)\n'

tm() {
 [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
 if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
 fi
 session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
eval "$(hub alias -s)"

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

