#!/bin/bash
set -e

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
