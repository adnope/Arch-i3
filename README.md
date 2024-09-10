# AdNope's i3wm dotfiles

![screenshot](https://i.imgur.com/k6W5gmD.png)

This configuration of i3 can be done by running Archinstall script with i3 desktop, pipewire and NetworkManager selected

## Change shell to zsh
Since Oh-my-zsh is not able to be stored in the repo, this is the commands to quickly install Oh-my-zsh and zsh-syntax-highlighting plugin:
```
sudo pacman -S zsh
```
oh-my-zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
zsh-syntax-highlighting:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Fonts that I use:
- Nerd Fonts:
    ```
    sudo pacman -S ttf-firacode-nerd ttf-jetbrains-mono-nerd
    ```
- Microsoft Fonts:

    According to Arch Wiki, this is how to get microsoft fonts from an existing Windows C Drive partition:
    ```
    sudo mount --mkdir /window_partition /run/media/adnope/Windows
    sudo mkdir -p /usr/local/share/fonts/WindowsFonts
    sudo cp /run/media/adnope/Windows/Windows/Fonts/*.ttf /usr/local/share/fonts/WindowsFonts/
    sudo chmod 644 /usr/local/share/fonts/WindowsFonts/*
    fc-cache --force
    ```

## Installing yay as AUR helper
```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```
## Preparation
Packages to install:
```
sudo pacman -S picom polybar rofi kitty starship fastfetch
yay -S qimgv-git
```
ibus-bamboo:
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/BambooEngine/ibus-bamboo/master/archlinux/install.sh)"
```
Browser and IDEs:
```
yay -S visual-studio-code-bin brave-bin sublime-text-4
```

## Notes for each package:

### i3wm:
Necessary packages:
```
sudo pacman -S kwallet kwallet-pam polkit-kde-agent xorg-xrandr xorg-xinput brightnessctl playerctl feh bluez flameshot lxappearance xcolor nemo kolourpaint micro
```

To unlock KDE wallet automatically on login, make sure these two lines are present in /etc/pam.d/sddm:
```
auth            optional        pam_kwallet5.so
session         optional        pam_kwallet5.so auto_start
```
Kde authentication agent:
```
sudo pacman -S polkit-kde-agent
```

Setting wallpaper:
```
sudo pacman -S feh
```

### Applets:
```
sudo pacman -S bluez blueman
sudo systemctl enable bluetooth
```

### Polybar:
The spotify module needs python-dbus to work so:
```
sudo pacman -S python-dbus
```
In the backlight module, to allow changing brightness by scroll wheel you have to add the current user to the 'video' group and write a udev rule.

Adding user to 'video' group:
```
usermod -aG video $USER
```
Create the "/etc/udev/rules.d/backlight.rules" file. For my system using nvidia as the backlight vendor, it contains these lines:
```
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="nvidia_0", RUN+="/usr/bin/chgrp video /sys/class/backlight/nvidia_0/brightness"

ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="nvidia_0", RUN+="/usr/bin/chmod g+w /sys/class/backlight/nvidia_0/brightness"

ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="nvidia_0", RUN+="/usr/bin/chgrp video /sys/class/backlight/nvidia_0/actual_brightness"

ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="nvidia_0", RUN+="/usr/bin/chmod g+w /sys/class/backlight/nvidia_0/actual_brightness"
```
This gives polybar the permission to change the 'brightness' and 'actual_brightness' files. If you don't use an nvidia card or use other backlight vendors, check out [Arch Wiki - Backlight](https://wiki.archlinux.org/title/Backlight#Udev_rule).

## GTK themes
I use LXappearance to quickly set GTK themes:
- General: Dracula
    ```
    sudo cp -r ~/Arch-i3/GTK-Themes/Dracula /usr/share/themes
    ```
- Icons: Kora
    ```
    sudo cp -r ~/Arch-i3/GTK-Themes/kora /usr/share/icons
    ```
- Mouse cursor: Future-dark
    ```
    sudo cp -r ~/Arch-i3/GTK-Themes/Future-dark-cursors /usr/share/icons  
    ```
- Font: Segoe UI Variable Regular Small 14