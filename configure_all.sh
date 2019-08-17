#!/bin/sh

SET_USER=$1
MY_REPO_CONFIG=https://raw.githubusercontent.com/JaroslawSlabik/archlinux-config/master

#install font FiraMono Nerd Fonts
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

chown -R $SET_USER:$SET_USER /home/$SET_USER/.config


#Configuration display screen
wget -O /etc/sddm.conf $MY_REPO_CONFIG/sddm_config/sddm.conf

#Configuration terminal urxvt
cat <<EndOfFile >> /home/$SET_USER/.Xresources
URxvt.background:           #000000
URxvt.foreground:           #D4D4D4

URxvt.scrollBar:            true
URxvt.scrollBar_right:      true
URxvt.scrollTtyOutput:      false
URxvt.scrollWithBuffer:     true
URxvt.scrollTtyKeypress:    true

URxvt.font:                 xft:FiraMono\ Nerd\ Font\ Mono:size=10
URxvt.boldFont:             xft:FiraMono\ Nerd\ Font\ Mono:bold:size=10
URxvt.italicFont:           xft:FiraMono\ Nerd\ Font\ Mono:italic:size=10
URxvt.boldItalicFont:       xft:FiraMono\ Nerd\ Font\ Mono:bold:italic:size=10

URxvt.saveLines:            10000

URxvt.iso14755:             false
URxvt.iso14755_52:          false

URxvt.keysym.S-C-C:         eval:selection_to_clipboard
URxvt.keysym.S-C-V:         eval:paste_clipboard

EndOfFile

chown -R $SET_USER:$SET_USER /home/$SET_USER/.Xresources

sudo -u $SET_USER xrdb -load /home/$SET_USER/.Xresources
:call color_coded#moved()


#Configuration vim
git clone https://github.com/JaroslawSlabik/vim-config.git /home/$SET_USER/vim-config

mkdir -p /home/$SET_USER/.vim/config
mkdir -p /home/$SET_USER/.vim/vimfiles/bundle

mv /home/$SET_USER/vim-config/vimrc /home/$SET_USER/.vim
mv /home/$SET_USER/vim-config/config/* /home/$SET_USER/.vim/config
mv /home/$SET_USER/vim-config/colors/* /usr/local/share/vim/vim81/colors

rm -rf /home/$SET_USER/vim-config
git clone https://github.com/VundleVim/Vundle.vim.git /home/$SET_USER/.vim/vimfiles/bundle/Vundle.vim

chown -R $SET_USER:$SET_USER /home/$SET_USER/.vim

sudo -u $SET_USER vim +PluginInstall +qall

#Compile color_coded for vim
cd /home/$SET_USER/.vim/vimfiles/bundle/color_coded
rm -f CMakeCache.txt
mkdir build
cd build
cmake -DLLVM_ROOT_DIR=/usr/lib/cmake/llvm ..
make && make install
make clean && make clean_clang

cd ~

chown -R $SET_USER:$SET_USER /home/$SET_USER/.vim

