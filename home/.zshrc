# Needed for themes
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
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Customize prompt
PS1='%B%F{blue}%C%f %F{cyan}>%f%b '

# Enable plugins
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="exa"
alias ll="exa -l"
alias la="exa -a"
alias asl="exa -la"

alias md="mkdir"
alias rd="rm -r"
alias e="emacs"
alias t="trans"

alias cb="cargo build"
alias cr="cargo run"
alias cbr="cargo build -r"
alias crr="cargo run -r"
