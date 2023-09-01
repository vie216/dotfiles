# Needed for plugins
autoload -Uz compinit && compinit -D

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Navigation by words with Ctrl+Arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History saving
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# Setup PATH
source ~/.cargo/env

# Theme and plugins
eval "$(starship init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias install="sudo apt install"
alias remove="sudo apt autoremove --purge"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="exa"
alias ll="exa -l"
alias la="exa -a"
alias asl="exa -la"

alias cb="cargo build"
alias cr="cargo run"
alias cbr="cargo build -r"
alias crr="cargo run -r"

alias md="mkdir"
alias rd="rm -r"
alias e="emacs"
alias t="trans"
