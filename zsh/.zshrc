# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
PYTHON_VENV_NAME=".venv"
PYTHON_VENV_NAMES=($PYTHON_VENV_NAME venv)
BROWSER="brave"
EDITOR="kate"

plugins=(
    aliases
    common-aliases
    python
    git
    archlinux
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias uzsh="exec zsh"
alias zshrc="kate >/dev/null 2>&1 ~/.zshrc"

alias ff="fastfetch"
alias c="clear"

alias chargemode="~/MyScripts/charging_mode.sh" # Used for Lenovo laptops, feel free to remove if you don't need it

alias fkeys="sudo input-remapper-control --command start --device \"SONiX Gaming Keyboard\" --preset fkeys"
