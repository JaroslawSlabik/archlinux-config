#!/usr/bin/sh

cd ~

#install:
yay -S \
\ #### envirmoment i3 ####
    i3 \
    i3status \
    i3lock-fancy \
    dunst \
    compton \
    rofi \
    polybar-full \
    sddm \
    archlinux-themes-sddm \
\ #### terminal ####
    alacritty \
    termite \
\ #### Apps ####
    screenfetch \
    highlight \
    python2 \
    pyton3 \
    lutirs \
    vlc \
    gcc \
    xrandr \
    gimp \
    unzip \
    zip \
    unrar \
    rar \
    ntfs-3g \
    dolphin \
    cmake


#Configurations:
#i3
mkdir -p /home/jslabik/.config/i3
wget -O /home/jslabik/.config/i3/config https://raw.githubusercontent.com/mhinz/vim-startify/master/.travis.yml

#sddm
wget -O /etc/sddm.config https://raw.githubusercontent.com/mhinz/vim-startify/master/.travis.yml

#terminal
mkdir -p /home/jslabik/.config/alacritty
wget -O /home/jslabik/.config/alacritty/alacritty.yml https://raw.githubusercontent.com/mhinz/vim-startify/master/.travis.yml


#vim

