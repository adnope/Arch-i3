# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
plugins=(
    git
    archlinux
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias uzsh="source ~/.zshrc"
alias zshconfig="micro ~/.zshrc"

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

export JAVA_HOME=/usr/lib/jvm/java-23-openjdk
export PATH=$JAVA_HOME/bin:$PATH

export ANDROID_HOME=$HOME/dev/android/android-sdk
export PATH=$PATH:$HOME/dev/android/android-sdk/cmdline-tools/latest/bin
