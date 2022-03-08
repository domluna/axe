export PS1="λ %~: "

if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; fi # added by Nix installer
if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]; then source /nix/var/nix/profiles/default/etc/profile.d/nix.sh; fi # added by Nix installer

export GO111MODULE=on
# Go
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/nvim-osx64/bin

export EDITOR=nvim

alias j='julia'
#alias ls='exa'
#alias cat='bat'
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

export FZF_DEFAULT_OPTS='--height 80% --reverse --inline-info'
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

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

. "$HOME/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in *:/Users/lunaticd/.juliaup/bin:*);; *)
    export PATH=/Users/lunaticd/.juliaup/bin${PATH:+:${PATH}};;
esac

# <<< juliaup initialize <<<
export PATH=$HOME/opt/anaconda3/bin:$PATH

export PATH="/Users/lunaticd/.local/share/solana/install/active_release/bin:$PATH"

eval "$(direnv hook zsh)"

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

export DENO_INSTALL="/Users/lunaticd/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
