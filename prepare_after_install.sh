#!/usr/bin/sh
pacman -S wget libnewt
#wget archdi.sf.net/archdi
#sh archdi

#Base
pacman -S \
    autoconf \
    automake \
    binutils \
    bison \
    fakeroot \
    file \
    findutils \
    flex \
    gawk \
    gcc \
    gettext \
    grep \
    groff \
    gzip \
    libtool \
    m4 \
    make \
    cmake \
    pacman \
    patch \
    pkgconf \
    sed \
    sudo \
    systemd \
    texinfo \
    util-linux \
    which

#Yay and pakiets for yay
pacman -S \
    perl-error \
    perl-maitools \
    perl-timedate \
    git \
    go \
    yay

#Update using yay
yay -Syu

#Tools for terminal
yay -S \
    pacman-contrib \
    base-devel \
    bash-completion \
    lsof \
    dmidecode \
    dialog \
    mc

#Tools for zip
yay -S \
    zip \
    unzip \
    rar \
    unrar \
    p7zip

#Tools for network
yay -S \
    rsync \
    traceroute \
    bind-tools \
    net-tools \
    networkmanager \
    openssh
systemctl enable NetworkManager
systemctl disable dhcpcd
systemctl enable sshd


#Kernel and headers
yay -S linux linux-headers

#Extra
yay -S \
    cronie \
    xdg-user-dirs \
    haveged \
    intel-ucode \
    screenfetch \
    highlight
systemctl enable cronie
systemctl enable numlockon
systemctl enable haveged

#File system support
yay -S \
    dosfstools \
    ntfs-3g \
    btrfs-progs \
    exfat-utils \
    autofs \
    fuse2 \
    fuse3 \
    fuseiso \
    dolphin

#Sound support
yay -S \
    alsa-utils \
    alsa-plugins \
    pulseaudio \
    pulseaudio-alsa

#Print support
yay -S \
    cups \
    ghostscript cups-pdf
systemctl enable org.cups.cupsd

#XOrg
yay -S \
    xorg-server \
    xorg-xinit \
    xorg-xrandr

#Fonts
yay -S \
    font-bh-ttf \
    font-bitstream-speedo \
    gsfonts \
    sdl_ttf \
    ttf-bitstream-vera \
    ttf-dejavu \
    ttf-liberation \
    xorg-fonts-type1

#Input
yay -S xf86-input-libinput


#Office
yay -S \
    libreoffice-fresh \
    libreoffice-fresh-pl \
    languagetool \
    hunspell-pl \
    hyphen-pl \
    mythes-pl

#Internet
yay -S \
    thunderbird \
    thunderbird-i18n-pl
    google-chrome

#Multimedia
yay -S vlc

#Graphic
yay -S gimp

#Game
yay -S \
    wine \
    zenity \
    lutirs

#Python
yay -S \
    python2 \
    python3


useradd -G root -d /home/jslabik -m jslabik
passwd jslabik


#Install envirmoment i3
yay -S \
    i3 \
    i3status \
    i3lock-fancy \
    dunst \
    compton \
    rofi \
    polybar-full

#Configuration envirmoment i3
mkdir -p /home/jslabik/.config/i3
wget -O /home/jslabik/.config/i3/config https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master/i3_config/config


#Install display screen
yay -S \
    sddm \
    archlinux-themes-sddm

#Configuration display screen
wget -O /etc/sddm.config https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master/sddm_config/sddm.conf


#Install terminal
yay -S \
    alacritty \
    termite

#Configuration terminal
mkdir -p /home/jslabik/.config/alacritty
wget -O /home/jslabik/.config/alacritty/alacritty.yml https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master/alacirtty_config/alacritty.yml


#vim

