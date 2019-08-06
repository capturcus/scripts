#!/bin/bash

set -e
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
wget -qO - https://downloads.iridiumbrowser.de/ubuntu/iridium-release-sign-01.pub | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
echo "deb [arch=amd64] https://downloads.iridiumbrowser.de/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/iridium.list
echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-backports main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-security main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
sudo apt-get update

sudo apt-get install zsh git build-essential software-properties-common vim-gtk compton alsa-utils pulseaudio xinit software-properties-common i3 iridium-browser rxvt-unicode code wicd-curses gitk -y
#echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list

#sudo mkdir -p /etc/systemd/system/getty@tty1.service.d

cat <<EOT >> /etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noissue --autologin marcin %I $TERM
Type=idle
EOT

#after running this script install and run configuremegently
