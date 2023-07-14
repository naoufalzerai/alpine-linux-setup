#!/bin/ash

apk add wget net-tools font-terminus dmenu ncurses
apk add build-base xrandr dbus-x11 setup-xorg-base 
# apk add i3wm i3status i3lock  xterm
apk add mesa-gl doas dbus vim 
apk add  libx11-dev libxinerama-dev libxft-dev
# apk add docker docker-compose

# add flatpak
apk add flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# add user
adduser near

chown -R near:near /home/near

# add user to groups
adduser near wheel
addgroup docker
adduser near input 
adduser near docker
adduser near video

# give near write access to /opt dir
# chown near:near /opt

setup-xorg-base

#install dmenu
mkdir code
cd code
git clone https://github.com/naoufalzerai/dwm
cd dmenu 
make install
git clone https://github.com/naoufalzerai/st
cd ..
cd st
make install
git clone https://github.com/naoufalzerai/surf
cd ..
cd surf
make install


