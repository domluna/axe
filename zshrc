export PS1="λ %~: "

export GO111MODULE=on
# Go
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/nvim-macos/bin
export PATH=$PATH:$HOME/.local/bin

export JULIA_STACKTRACE_MINIMAL=true

alias j='julia'
alias jn='$HOME/julia/julia'
alias jfmt='julia --startup=no -e "using JuliaFormatter; format(\".\")"'
alias js='julia --startup=no'

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

# if $HOME/.tokens exists source it
if [ -f "$HOME/.tokens" ]; then
  source "$HOME/.tokens"
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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/Users/lunaticd/zig-macos"

export FLYCTL_INSTALL="/Users/lunaticd/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Wasmer
export WASMER_DIR="/Users/lunaticd/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

[[ "$(uname)" != "Darwin" ]] && LLVM_ENABLE_LLD="ON" || LLVM_ENABLE_LLD="OFF"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

 export PATH="/Users/lunaticd/code/executorch/third-party/flatbuffers/cmake-out:${PATH}"

export LLAMACPP_DIR="$HOME/code/llama.cpp"

mk() {
    # Extract the directory path from the provided full file path
    local dir_path=$(dirname "$1")

    # Create the directory if it does not exist
    mkdir -p "$dir_path"

    # Create the file
    touch "$1"
}

alias c="open $1 -a \"Visual Studio Code\""

# sst
export PATH=/Users/lunaticd/.sst/bin:$PATH
