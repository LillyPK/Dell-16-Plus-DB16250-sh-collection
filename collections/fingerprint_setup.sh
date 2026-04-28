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
