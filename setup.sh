#!/bin/bash
set -e

echo "[+] Installing yay and updating system. Don't set and forget this script, you might be asked for your password."

sudo pacman -S yay pamac --noconfirm
sudo pacman -Syyu --noconfirm
yay -Syyua --noconfirm --sudoloop

DEPS=(base-devel wget git cmake python3 zsh virtualenv clion cowsay docker emacs firefox mpv thunderbird tunsafe valgrind vim clion dropbox slack-desktop skypeforlinux-stable-bin discord nvm zoom)
echo "[+] Installing packages: " "${DEPS[@]}"
yay -S --noconfirm --sudoloop "${DEPS[@]}"

echo "[+] Installing oh-my-zsh"

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)

echo "[+] Enabling docker as non-sudo user"

sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl enable docker
sudo systemctl start docker
newgrp docker

echo "[+] Installing spacemacs"

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


