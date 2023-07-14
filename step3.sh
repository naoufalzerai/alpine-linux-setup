#!/bin/ash

rc-service dbus start
rc-update add dbus

# # rc-service lightdm start
# # rc-update add lightdm

# # rc-service docker start
# # rc-update add docker boot

dbus-uuidgen > /var/lib/dbus/machine-id
flatpak install flathub com.visualstudio.code
flatpak install flathub org.mozilla.firefox

# startx /usr/bin/i3