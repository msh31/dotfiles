#
#   Hi there! This is my first zsh customization, I've only used bash before this so we'll see how it goes :D
#

# path to your oh-my-zsh installation
# export ZSH="$HOME/.oh-my-zsh"

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000 # mem
SAVEHIST=10000 # dsk
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# enable completion system
autoload -Uz compinit
compinit

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# colored output
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# basic aliases
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# git aliases
alias wip='git add . && git commit -m "wip" && git push'

# custom functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# da prompt
PROMPT='%F{cyan}%n@%m%f:%F{blue}%~%f$ '

# load additional configurations
[ -f ~/.zshrc.local ] && source ~/.zshrc.local