#!/bin/bash
set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
    networkmanager \
    network-manager-applet \
    networkmanager-openvpn \
    wireless-regdb \
    ufw \
    bluez-obex

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now ufw
