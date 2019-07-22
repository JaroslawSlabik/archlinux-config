#!/usr/bin/sh
clear
echo 'Install wget...\n'
read -rsp $'Press enter to continue...\n'
pacman -S wget libnewt

#Base
clear
echo 'Install base packets...\n'
read -rsp $'Press enter to continue...\n'
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

clear
echo 'Install pakiets for yay...\n'
read -rsp $'Press enter to continue...\n'
#Pakiets for yay
pacman -S \
    perl-error \
    perl-mailtools \
    perl-timedate \
    git \
    go

#Create user aurbuilder
clear
echo 'Create user aurbuilder...\n'
read -rsp $'Press enter to continue...\n'
useradd -r -N -M -d /tmp/aurbuilder -s /usr/bin/nologin -p ---- aurbuilder
mkdir -p /tmp/aurbuilder
chmod 777 /tmp/aurbuilder
echo "aurbuilder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/aurbuilder
echo "root ALL=(aurbuilder) NOPASSWD: ALL" >> /etc/sudoers.d/aurbuilder

clear
echo 'Install yay...\n'
read -rsp $'Press enter to continue...\n'
cd /tmp/aurbuilder
sudo -u aurbuilder git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u aurbuilder makepkg -si

#Update using yay
clear
echo 'Update using yay...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -Syu

#Tools for terminal
clear
echo 'Install tools for terminal ...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    pacman-contrib \
    base-devel \
    bash-completion \
    lsof \
    dmidecode \
    dialog \
    mc

#Tools for zip
clear
echo 'Install tools for zip...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    zip \
    unzip \
    rar \
    unrar \
    p7zip

#Tools for network
clear
echo 'Install tools for network...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
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
clear
echo 'Install kernel...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S linux linux-headers

#Extra
clear
echo 'Install extra...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder sudo -u aurbuilder yay -S \
    cronie \
    xdg-user-dirs \
    haveged \
    intel-ucode \
    neofetch \
    highlight
systemctl enable cronie
systemctl enable numlockon
systemctl enable haveged

#File system support
clear
echo 'Install file system support...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
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
clear
echo 'Install sound support...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    alsa-utils \
    alsa-plugins \
    pulseaudio \
    pulseaudio-alsa

#Print support
clear
echo 'Install print support...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    cups \
    ghostscript cups-pdf
systemctl enable org.cups.cupsd

#XOrg
clear
echo 'Install XOrg...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    xorg-server \
    xorg-xinit \
    xorg-xrandr

#Fonts
clear
echo 'Install fonts...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    font-bh-ttf \
    font-bitstream-speedo \
    gsfonts \
    sdl_ttf \
    ttf-bitstream-vera \
    ttf-dejavu \
    ttf-liberation \
    xorg-fonts-type1

#Input
clear
echo 'Install input lib...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S xf86-input-libinput


#Office
clear
echo 'Install input lib...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder  yay -S \
    libreoffice-fresh \
    libreoffice-fresh-pl \
    languagetool \
    hunspell-pl \
    hyphen-pl \
    mythes-pl

#Internet
clear
echo 'Install internet...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    thunderbird \
    thunderbird-i18n-pl
    google-chrome

#Multimedia
clear
echo 'Install multimedia...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S vlc

#Graphic
clear
echo 'Install graphic...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S gimp

#Game
#clear
#echo 'Install graphic...\n'
#read -rsp $'Press enter to continue...\n'
# sudo -u aurbuilder yay -S \
#    wine \
#    zenity \
#    lutirs

#Python
clear
echo 'Install python...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    python2 \
    python3

clear
echo 'Create user jslabik...\n'
read -rsp $'Press enter to continue...\n'
useradd -d /home/jslabik -m jslabik
passwd jslabik
usermod -aG sudo jslabik

#Install envirmoment i3
clear
echo 'Install envirmoment i3...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    i3-wm \
    i3status \
    i3lock-fancy-git \
    dunst \
    compton \
    rofi \
    polybar-full

#Configuration envirmoment i3
clear
echo 'Configuration envirmoment i3...\n'
read -rsp $'Press enter to continue...\n'
mkdir -p /home/jslabik/.config/i3
wget -O /home/jslabik/.config/i3/config https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master/i3_config/config


#Install display screen
clear
echo 'Install display screen SDDM...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    sddm \
    archlinux-themes-sddm
systemctl enable sddm.service

#Configuration display screen
wget -O /etc/sddm.config https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master/sddm_config/sddm.conf


#Install terminal
clear
echo 'Install terminal...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    alacritty \
    termite

#Configuration terminal
mkdir -p /home/jslabik/.config/alacritty
wget -O /home/jslabik/.config/alacritty/alacritty.yml https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master/alacirtty_config/alacritty.yml

#Delete user aurbuilder
clear
echo 'Delete user aurbuilder...\n'
read -rsp $'Press enter to continue...\n'
userdel -r aurbuilder

clear
echo 'Reboot...\n'
read -rsp $'Press enter to continue...\n'
systemctl reboot
#vim

