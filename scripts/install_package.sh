#!/bin/bash

sudo pacman -Syu
sudo pacman -S --needed base-devel git

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

sudo pacman -S --noconfirm quickshell wayland wayland-protocols swaylock swww

yay -S --noconfirm qml-niri mpvpaper

echo "done"
