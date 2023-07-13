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
# mkdir -p /home/near/wallpaper
# mkdir -p /home/near/.config/i3

# user setup near
# cp ./near/wallpaper/compass.jpg /home/near/wallpaper/compass.jpg
# cp ./near/.config/i3/config /home/near/.config/i3/config
# cp ./near/.profile /home/near/.profile
# mkdir -p /home/near/.scripts
# cp ./near/login-script.sh /home/near/.scripts/login-script.sh
chown -R near:near /home/near


# greeter background
# echo "background=/home/near/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
# cp ./near/near /var/lib/AccountsService/users
# chown root:root /var/lib/AccountsService/users/near

# add user to groups
adduser near wheel
addgroup docker
adduser near input 
adduser near docker
adduser near video

# give near write access to /opt dir
# chown near:near /opt

setup-xorg-base

# mkdir /opt/docker
# mkdir -p /opt/docker
# cp ./docker/* /opt/docker/
# chown near:near /opt/docker

#install dmenu
mkdir code
cd code
git clone https://github.com/naoufalzerai/dmenu
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


