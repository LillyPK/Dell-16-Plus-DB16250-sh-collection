#!/bin/bash
set -e

sudo pacman -Syu --noconfirm

if ! command -v git &>/dev/null; then
    sudo pacman -S --needed --noconfirm git
fi

sudo pacman -S --needed --noconfirm fprintd libfprint

sudo systemctl enable --now fprintd

fprintd-enroll

fprintd-verify

sudo sed -i 's/#%PAM-1.0/#%PAM-1.0\nauth\t\tsufficient\tpam_fprintd.so/' /etc/pam.d/sudo

sudo echo test

sudo pacman -S --needed --noconfirm \
    networkmanager \
    network-manager-applet \
    networkmanager-openvpn \
    wireless-regdb \
    ufw

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now ufw

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

printf '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n' | sudo tee -a /etc/pacman.conf

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
    intel-compute-runtime \
    intel-graphics-compiler \
    intel-gmmlib \
    level-zero-loader \
    intel-oneapi-base-toolkit \
    intel-media-driver \
    intel-npu-driver \
    intel-ucode \
    linux-firmware-intel \
    vulkan-intel \
    lib32-vulkan-intel \
    libva-intel-driver

sudo pacman -S --needed --noconfirm tmux cava

sudo pacman -S --noconfirm brave-bin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source "$HOME/.cargo/env"

curl -fsSL https://raw.githubusercontent.com/LillyPK/bsdmp/refs/heads/master/install.sh | bash
