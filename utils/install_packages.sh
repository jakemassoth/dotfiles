#!/bin/bash
sudo pacman -S --needed - < ~/pkglist.lst
yay -S --needed - < ~/locallist.lst
