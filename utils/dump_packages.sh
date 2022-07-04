#!/bin/bash
pacman -Qqet | grep -v "$(pacman -Qqm)" > ~/pkglist.lst
pacman -Qqem > ~/locallist.lst

