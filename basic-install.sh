#!/bin/bash

sudo apt-get install riseup-vpn vlc filelight okular synaptic timeshift flatpak plasma-discover-backend-flatpak wget

echo "installing brave now"
curl -fsS https://dl.brave.com/install.sh | sh

echo "installing miktek now"
curl -fsSL https://miktex.org/download/key | sudo tee /usr/share/keyrings/miktex-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/miktex-keyring.asc] https://miktex.org/download/debian bookworm universe" | sudo tee /etc/apt/sources.list.d/miktex.list
sudo apt-get update
sudo apt-get install miktex
miktexsetup finish
initexmf --set-config-value [MPM]AutoInstall=1

echo "installing texstudio now"
sudo apt-get install texstudio

echo "installing calibre now"
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

echo "installing pdf arranger"
sudo apt-get install python3-pip python3-wheel python3-gi python3-gi-cairo \
    gir1.2-gtk-3.0 gir1.2-poppler-0.18 gir1.2-handy-1 python3-setuptools
pip3 install --user --upgrade https://github.com/pdfarranger/pdfarranger/zipball/main

echo "installing touchegg"
sudo add-apt-repository ppa:touchegg/stable
sudo apt update
sudo apt install touchegg

echo "installing touche"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.joseexposito.touche

echo "installing ruby"
wget https://github.com/postmodern/ruby-install/releases/download/v0.10.1/ruby-install-0.10.1.tar.gz
tar -xzvf ruby-install-0.10.1.tar.gz
cd ruby-install-0.10.1/
sudo make install
ruby-install ruby

