#!/bin/ash

apk add wget curl socat nmap net-tools build-base setxkbmap sudo xrandr bash zsh dbus dbus-x11 sudo setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
#apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add slim i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add docker docker-compose

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

# add near to sudoers
#cat ./near/sudoers >> /etc/sudoers
adduser near wheel

# greeter background
# echo "background=/home/near/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./near/near /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/near

# add user to docker
addgroup near docker

# enable copy paste in vmware
chmod g+s /usr/bin/vmware-user-suid-wrapper

# give near write access to /opt dir
chown near:near /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown near:near /opt/docker


