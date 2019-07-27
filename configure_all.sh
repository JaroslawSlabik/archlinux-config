#!bin/sh

SET_USER=$1
MY_REPO_CONFIG=https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master

#install font
mkdir -p /usr/share/fonts/FiraMono
wget -O /usr/share/fonts/FiraMono/FiraMono.otf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fira%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.otf
chmod 555 /usr/share/fonts/FiraMono
chmod 444 /usr/share/fonts/FiraMono/FiraMono.otf
fc-cache -vf

#Configuration envirmoment i3
mkdir -p /home/$SET_USER/.config/i3
wget -O /home/$SET_USER/.config/i3/config $MY_REPO_CONFIG/i3_config/config

#Configuration polybar
mkdir -p /home/$SET_USER/.config/polybar
wget -O /home/$SET_USER/.config/polybar/launch.sh $MY_REPO_CONFIG/polybar_config/launch.sh
chmod +x /home/$SET_USER/.config/polybar/launch.sh
wget -O /home/$SET_USER/.config/polybar/config $MY_REPO_CONFIG/polybar_config/config
wget -O /home/$SET_USER/.config/polybar/my_ip.sh $MY_REPO_CONFIG/polybar_config/my_ip.sh
chmod +x /home/$SET_USER/.config/polybar/my_ip.sh

#Configuration display screen
wget -O /etc/sddm.conf $MY_REPO_CONFIG/sddm_config/sddm.conf

#Configuration terminal
mkdir -p /home/$SET_USER/.config/alacritty
wget -O /home/$SET_USER/.config/alacritty/alacritty.yml $MY_REPO_CONFIG/alacirtty_config/alacritty.yml

chown -R $SET_USER:$SET_USER /home/$SET_USER/.config

