#
#   hi there! this is my first zsh customization, i've only used bash before this so we'll see how it goes :D
#

export DOTFILES="$HOME/dotfiles"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(
    zsh-autosuggestions 
    zsh-syntax-highlighting
    git    
)

source $ZSH/oh-my-zsh.sh

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000 # mem
SAVEHIST=10000 # dsk
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# enable completion system
autoload -Uz compinit
compinit -u

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# colored output
export CLICOLOR=1a
export LSCOLORS=GxFxCxDxBxegedabagaced

# basic aliases
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# dev aliases
alias build-windows="mkcd build-windows && cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/windows-toolchain.cmake -DBUILD_EXAMPLES=ON && cmake --build . -j$(sysctl -n hw.ncpu) && .."
alias lg='lazygit'
alias ld='lazydocker'

# terminal tool aliases
alias tls='tmux list-sessions'
alias tat='tmux attach -t'
alias tkl='tmux kill-server'
alias tsf='tmux source-file ~/.tmux.conf'
alias vim='nvim'

# custom functions
tm() {
    if [[ $# -eq 1 ]]; then
        tmux has-session -t $1 2>/dev/null && tmux attach -t $1 || tmux new-session -s $1
    else
        echo "Usage: tm <session-name>"
        tmux list-sessions 2>/dev/null || echo "No active sessions"
    fi
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

wip() {
    local message="${1:-wip}"
    git add . && git commit -m "$message" && git push
}

reload() {
    source ~/.zshrc &&
    source ~/.tmux.conf && 
    echo "reloaded configs!"
}

edots() {
    ${EDITOR:-nano} "$DOTFILES"
}

grr() {
    echo ""
    echo "Marco's dotfiles helper"
    echo ""
    echo "Usage:"
    echo "  grr              Show this help message"
    echo ""
    echo "Shortcuts & Aliases:"
    echo "  mkcd <dir>       Make and cd into directory"
    echo "  wip [msg]        Commit all changes with a message (default: 'wip')"
    echo "  code             Open VS Code in current dir"
    echo "  .. / ...         Go up one / two directories"
    echo "  reload           Reloads the zsh config"
    echo "  grep             Enhanced grep with color"
    echo ""
    echo "Examples:"
    echo "  mkcd projects/new-app"
    echo "  wip 'refactor login'"
    echo ""
    echo "🔧 Customize this in ~/.zshrc"
    echo ""
}

code () { 
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;
}

clion () { 
    CLION_CWD="$PWD" open -n -b "com.jetbrains.CLion" --args "$@" ;
}

# git status function for prompt
git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        local git_status=""
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            git_status="*"
        fi
        echo " %{%F{40}%}($branch$git_status)%{%f%}"
    fi
}

# enable prompt substitution
setopt PROMPT_SUBST

# enable autocorrect
setopt CORRECT

# bind tab to accept autosuggestions
bindkey '^I' autosuggest-accept

# da prompt
PROMPT='%{%F{243}%}%n%{%F{245}%}@%{%F{249}%}%m %{%F{254}%}%c$(git_prompt_info) %{%f%}$ '

# load additional configurations
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
