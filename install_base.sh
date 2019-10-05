#!/bin/bash

set -e

#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-backports main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
sudo apt-get update

sudo apt-get install zsh git build-essential python-software-properties vim-gtk compton alsa-utils pulseaudio xinit software-properties-common hsetroot default-jre python-pip i3 wicd-curses gitk -y

wget -qO - https://downloads.iridiumbrowser.de/ubuntu/iridium-release-sign-01.pub|sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/iridium-browser.list
deb [arch=amd64] https://downloads.iridiumbrowser.de/deb/ stable main
#deb-src https://downloads.iridiumbrowser.de/deb/ stable main
EOF

sudo add-apt-repository -y ppa:mmstick76/alacritty

sudo apt-get update
sudo apt-get install iridium-browser alacritty -y

sudo pip install --upgrade pip
sudo pip install jinja2

sudo snap install --classic code
