#!/bin/bash
set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm tmux cava

sudo pacman -S --noconfirm brave-bin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source "$HOME/.cargo/env"

curl -fsSL https://raw.githubusercontent.com/LillyPK/bsdmp/refs/heads/master/install.sh | bash
