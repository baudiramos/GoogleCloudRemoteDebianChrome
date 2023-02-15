#!/bin/bash
echo Procediendo a instalar XFCE...
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service
sudo apt install --assume-yes task-xfce-desktop
curl -L -o google-chrome-stable_current_amd64.deb \
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes ./google-chrome-stable_current_amd64.deb
echo Introduce tu clave de Chrome Remote Desktop
read -r chrome
$chrome
sudo systemctl status chrome-remote-desktop@$USER
