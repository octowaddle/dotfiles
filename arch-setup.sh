#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Set up
#

# Install Paru
sudo pacman -Sy --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# Install software
#

# Basic software
paru -Sy --needed --noconfirm neovim bspwm sxhkd polybar picom-git playerctl pamixer alacritty bat exa clang fish fzf meson ninja ripgrep rofi tldr xorg-setxkbmap xorg-xset xorg-xsetroot fd clang-tools-extra nodejs npm xorg-xinit xorg-server man-db man-pages sudo nerd-fonts-jetbrains-mono visual-studio-code-bin python3 python-pip firefox github-cli discord pipewire-pulse

# Install Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Apply configuration
#

python3 $SCRIPT_DIR/apply.py --link --delete-existing
cp $SCRIPT_DIR/.xinitrc ~/.xinitrc
systemctl enable --now --user pipewire-pulse
