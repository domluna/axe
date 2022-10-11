export PS1="λ %~: "

if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; fi # added by Nix installer
if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]; then source /nix/var/nix/profiles/default/etc/profile.d/nix.sh; fi # added by Nix installer

export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels

export GO111MODULE=on
# Go
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/nvim-macos/bin

# julia
export JULIA_REVISE_INCLUDE=1
export JULIA_STACKTRACE_MINIMAL=true

alias j='julia'

if [ -n "${commands[exa]}" ]; then
  alias ls='exa'
fi
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ -n "${commands[nvim]}" ]; then
  alias vim='nvim'
  alias vi='nvim'
  alias v='nvim'
  export EDITOR=nvim
  # export EDITOR=nvim messes with the keybindings in the terminal
  # this sets it back to emacs style
  bindkey -e
fi

alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias md='mkdir -p'

export FZF_DEFAULT_OPTS='--height 80% --reverse --inline-info'
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude '{.git,mypy_cache,node_modules,vendor}/'"

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

if [ -n "${commands[bat]}" ]; then
  export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"
  alias cat='bat'
fi

# function gcob() {
#    git branch | grep --invert-match '\*' | cut -c 3- |
#       fzf --multi --preview="git log {}" |
#       xargs --no-run-if-empty git checkout
# }
#

# increase limit from 256
ulimit -n 250000

export PATH="$PATH:/Users/lunaticd/.foundry/bin"

export PATH="$PATH:/Users/lunaticd/.foundry/bin"

# bun completions
[ -s "/Users/lunaticd/.bun/_bun" ] && source "/Users/lunaticd/.bun/_bun"

# bun
export BUN_INSTALL="/Users/lunaticd/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lunaticd/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lunaticd/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lunaticd/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lunaticd/google-cloud-sdk/completion.zsh.inc'; fi

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

if [ -f "$HOME/.tokens" ]; then
  source $HOME/.tokens
fi
