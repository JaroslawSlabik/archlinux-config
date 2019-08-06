#!/usr/bin/sh

#Install wget
clear
echo 'Install wget...\n'
read -rsp $'Press enter to continue...\n'
yes | LC_ALL=en_US.UTF-8 pacman -S wget libnewt


#Base
clear
echo 'Install base packets...\n'
read -rsp $'Press enter to continue...\n'
yes | LC_ALL=en_US.UTF-8 pacman -S \
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


#Install pakiets for yay
clear
echo 'Install pakiets for yay...\n'
read -rsp $'Press enter to continue...\n'
#Pakiets for yay
yes | LC_ALL=en_US.UTF-8 pacman -S \
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
echo "aurbuilder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/aurbuilder
echo "root ALL=(aurbuilder) NOPASSWD: ALL" >> /etc/sudoers.d/aurbuilder
sudo -u aurbuilder mkdir -p /tmp/aurbuilder
chmod 777 /tmp/aurbuilder


#Install yay
clear
echo 'Install yay...\n'
read -rsp $'Press enter to continue...\n'
cd /tmp/aurbuilder
sudo -u aurbuilder git clone https://aur.archlinux.org/yay.git
cd yay
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 makepkg -si


#Update using yay
clear
echo 'Update using yay...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -Syu


#Tools for terminal
clear
echo 'Install tools for terminal ...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    pacman-contrib \
    bash-completion \
    lsof \
    dmidecode \
    dialog \
    mc


#Tools for zip
clear
echo 'Install tools for zip...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    zip \
    unzip \
    unrar \
    p7zip


#Tools for network
clear
echo 'Install tools for network...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
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
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    linux \
    linux-headers


#Extra
clear
echo 'Install extra...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
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
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    dosfstools \
    ntfs-3g \
    btrfs-progs \
    exfat-utils \
    autofs \
    fuse2 \
    fuse3 \
    fuseiso


#File manager
clear
echo 'Install file manager...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    dolphin


#Sound support
clear
echo 'Install sound support...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    alsa-utils \
    alsa-plugins \
    pulseaudio \
    pulseaudio-alsa
sudo -u aurbuilder yay -S \
    volnoti


#Print support
clear
echo 'Install print support...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    cups \
    ghostscript cups-pdf
systemctl enable org.cups.cupsd


#XOrg
clear
echo 'Install XOrg...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    xorg-server \
    xorg-xinit \
    xorg-xrandr


#Fonts
clear
echo 'Install fonts...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
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
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    xf86-input-libinput


#Office
clear
echo 'Install libreoffice...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    jre8-openjdk-headless \
    libreoffice-fresh \
    libreoffice-fresh-pl \
    languagetool \
    hunspell-pl \
    hyphen-pl \
    mythes-pl


#Install mail client
clear
echo 'Install mail client...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    thunderbird \
    thunderbird-i18n-pl


#Install browser
clear
echo 'Install browser...\n'
read -rsp $'Press enter to continue...\n'
sudo -u aurbuilder yay -S \
    google-chrome


#Multimedia
clear
echo 'Install multimedia...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    vlc


#Graphic
clear
echo 'Install graphic...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    gimp


##Game
#clear
#echo 'Install game...\n'
#read -rsp $'Press enter to continue...\n'
#yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
#    wine \
#    zenity \
#    lutirs


#Python
clear
echo 'Install python...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    python2 \
    python3


#Create user jslabik as SUDO
clear
echo 'Create user jslabik as SUDO...\n'
read -rsp $'Press enter to continue...\n'
useradd -d /home/jslabik -m jslabik
passwd jslabik
echo "jslabik ALL=(ALL) ALL" > /etc/sudoers.d/jslabik
sudo -u jslabik mkdir -p /home/jslabik/.config/yay
sudo -u jslabik mkdir -p /home/jslabik/.cache/yay


#Install envirmoment i3
clear
echo 'Install envirmoment i3...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    i3-gaps \
    i3status \
    i3lock-fancy-git \
    dunst \
    compton \
    rofi \
    polybar-full


#Install display screen
clear
echo 'Install display screen SDDM...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    sddm \
    archlinux-themes-sddm
systemctl enable sddm.service


#Install terminal
clear
echo 'Install terminal...\n'
read -rsp $'Press enter to continue...\n'
yes | sudo -u aurbuilder LC_ALL=en_US.UTF-8 yay -S \
    alacritty \
    termite

#Install vim
clear
echo 'Install vim...\n'
read -rsp $'Press enter to continue...\n'

DIR_CONFIG_PYTHON_2="$(find /usr/lib/python2.7 -name 'config.c' -printf '%h\n')"
DIR_CONFIG_PYTHON_3="$(find /usr/lib/python3.* -name 'config.c' -printf '%h\n')"

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
	        --enable-rubyinterp=yes \
	        --enable-pythoninterp=yes \
	        --with-python-config-dir=$DIR_CONFIG_PYTHON_2 \
	        --enable-python3interp=yes \
	        --with-python3-config-dir=$DIR_CONFIG_PYTHON_3 \
	        --enable-perlinterp=yes \
	        --enable-luainterp=yes \
            --enable-gui=gtk3 \
            --enable-cscope \
	        --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
make install
cd ~
rm rf vim

#Configure envirmoment
clear
echo 'Configure envirmoment...\n'
read -rsp $'Press enter to continue...\n'
mkdir -p /tmp/config
wget -O /tmp/config/configure_all.sh https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master/configure_all.sh
sh /tmp/config/configure_all.sh jslabik


#Delete user aurbuilder
clear
echo 'Delete user aurbuilder...\n'
read -rsp $'Press enter to continue...\n'
userdel -r aurbuilder


#Reboot
clear
echo 'Reboot...\n'
read -rsp $'Press enter to continue...\n'
systemctl reboot

#vim

