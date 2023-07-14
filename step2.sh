#!/bin/ash

apk add wget net-tools dmenu ncurses
apk add build-base 
apk add doas dbus vim setxkbmap
apk add libx11-dev libxinerama-dev libxft-dev harfbuzz-dev 

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
cd dwm && make install
git clone https://github.com/naoufalzerai/st
cd st && make install

