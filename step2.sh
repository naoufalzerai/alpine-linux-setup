#!/bin/ash

apk add wget net-tools dmenu ncurses
apk add build-base 
apk add doas dbus vim setxkbmap
apk add libx11-dev libxinerama-dev libxft-dev harfbuzz-dev 
apk add git make gcc g++ libx11-dev libxft-dev libxinerama-dev
apk add ncurses dbus-x11 adwaita-gtk2-theme adwaita-icon-theme ttf-dejavu xterm
# add flatpak
apk add flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# add user
adduser near

cp ./near/.config/ /home/near/
chown -R near:near /home/near

# add user to groups
adduser near wheel
addgroup docker
adduser near docker

# give near write access to /opt dir
# chown near:near /opt

setup-xorg-base
setxkbmap ca multix
#install dwm

git clone https://github.com/naoufalzerai/dwm
cd dwm && make clean install
git clone https://github.com/naoufalzerai/st
cd st && make clean install

