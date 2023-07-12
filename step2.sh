#!/bin/ash

apk add wget curl net-tools build-base xrandr dbus dbus-x11 setup-xorg-base  xterm
apk add i3wm i3status i3lock dmenu font-terminus
apk add mesa-gl doas

# add user
adduser near
mkdir -p /home/near/wallpaper
mkdir -p /home/near/.config/i3

# user setup near
cp ./near/wallpaper/compass.jpg /home/near/wallpaper/compass.jpg
cp ./near/.config/i3/config /home/near/.config/i3/config
cp ./near/.profile /home/near/.profile
mkdir -p /home/near/.scripts
cp ./near/login-script.sh /home/near/.scripts/login-script.sh
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
chown near:near /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown near:near /opt/docker


