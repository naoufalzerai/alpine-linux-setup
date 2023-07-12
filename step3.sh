#!/bin/ash
dbus-uuidgen > /var/lib/dbus/machine-id

rc-service dbus start
rc-update add dbus

rc-service lightdm start
rc-update add lightdm

rc-service docker start
rc-update add docker boot
