#!/bin/bash

set -e

#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-backports main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
#echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-security main restricted universe multiverse' | sudo tee -a /etc/apt/sources.list
#sudo apt-get update

sudo apt-get install zsh git build-essential software-properties-common vim-gtk compton alsa-utils pulseaudio xinit software-properties-common firefox -y
#sudo add-apt-repository ppa:webupd8team/java -y
#echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install oracle-java8-installer i3 -y

#after running this script install and run configuremegently
