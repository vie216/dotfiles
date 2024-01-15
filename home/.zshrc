# Setup completion
autoload -Uz compinit && compinit -D
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Make navigation more convenient
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -e

# Setup history saving
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# Customize prompt
PS1='%B%F{blue}%C%f %F{5}>%f%b '

# Enable plugins
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="ls --color"
alias ll="ls -l"
alias la="ls -a"
alias asl="ls -la"
alias md="mkdir"
alias rd="rm -r"
