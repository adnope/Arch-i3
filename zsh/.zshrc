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
alias ff="fastfetch"
alias c="clear"
alias h="history"
alias zshconfig="micro ~/.zshrc"
alias ins="sudo pacman -S"
alias upd="sudo pacman -Syu"
alias remv="sudo pacman -Rsc"
alias conservationmode="/home/adnope/cons_mode_control.sh" # Used for Lenovo laptops, feel free to remove if you don't need it
alias changefkeys="sudo input-remapper-control --command start --device \"SONiX Gaming Keyboard\" --preset Change_F_Keys"
alias changetospeakers="pactl set-default-source alsa_input.pci-0000_05_00.6.analog-stereo && pactl set-default-sink alsa_output.pci-0000_05_00.6.analog-stereo" # Changing default output and input devices (only for my system)
alias changetoheadphones="pactl set-default-source alsa_input.usb-UC02_UC02_UC02-00.mono-fallback && pactl set-default-sink alsa_output.usb-UC02_UC02_UC02-00.analog-stereo"

export EDITOR=micro

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
