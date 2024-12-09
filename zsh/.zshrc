# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
plugins=(
    git
    archlinux
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias uzsh="source ~/.zshrc"
alias zshconfig="kate ~/.zshrc"

alias ff="fastfetch"
alias c="clear"
alias h="history"

alias ins="sudo pacman -S"
alias upd="sudo pacman -Syu"
alias remv="sudo pacman -Rsc"
alias list="pacman -Qe"
alias m="micro"

alias conservationmode="~/MyScripts/cons_mode_control.sh" # Used for Lenovo laptops, feel free to remove if you don't need it

alias fkeys="sudo input-remapper-control --command start --device \"SONiX Gaming Keyboard\" --preset fkeys"

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=ibus

export JAVA_HOME=/usr/lib/jvm/jdk-22
export PATH=$JAVA_HOME/bin:$PATH
