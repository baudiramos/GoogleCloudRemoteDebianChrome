#!/bin/bash
sudo apt-get update
echo "Descargando Google remote desktop"
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
dpkg -i chrome-remote-desktop_current_amd64.deb
echo "Instalando entorno gráfico"
export DEBIAN_FRONTEND=noninteractive
apt install --assume-yes xfce4 desktop-base xfce4-terminal
bash -c 'echo \"exec /etc/X11/Xsession /usr/bin/xfce4-session\" > /etc/chrome-remote-desktop-session'
apt remove --assume-yes gnome-terminal
apt install --assume-yes xscreensaver
systemctl disable lightdm.service
echo "Instalando Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
echo Configurando equipo remoto
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AWtgzh7OLkIk5SQxQgM4aQAH834IRxLmTnXjSM31Dyz7ifixqJeziyred0ZHUuIbWaMoGw" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)
sudo apt-get install firefox -y
echo Escribe tu configurción de Google Chrome Remote Desktop: 
read -r chrome
$chrome
wget https://raw.githubusercontent.com/baudiramos/OtoHitsCollab/main/OtoHits.sh
chmod +x OtoHits.sh
./OtoHits.sh
