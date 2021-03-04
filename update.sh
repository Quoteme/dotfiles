#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2021-03-04 Do 10:49 09
#
# Copy all important dotfiles into this repo
#
rm -rf ./.config
mkdir .config
cp --recursive --update ~/.config/coc .config
cp --recursive --update ~/.config/dunst .config
cp --recursive --update ~/.config/jgmenu .config
cp --recursive --update ~/.config/matplotlib .config
cp --recursive --update ~/.config/networkmanager-dmenu .config
cp --recursive --update ~/.config/nvim .config
cp --recursive --update ~/.config/pcmanfm .config
cp --recursive --update ~/.config/picom .config
cp --recursive --update ~/.config/rofi .config
cp --recursive --update ~/.config/vifm .config
cp --recursive --update ~/.config/wal .config
cp --recursive --update ~/.config/zsh .config
cp --recursive --update ~/.config/stack.config.yaml .config
cp --recursive --update ~/.config/rofimoji.rc .config

cp --recursive --update ~/.vim ./
cp --recursive --update ~/.wallpaper ./
cp --recursive --update ~/.xmonad ./
cp --recursive --update ~/.xmonad ./

mkdir --parents .local/bin/
cp --recursive --update ~/.local/bin ./.local/bin

cp --update ~/.ghci ./.ghci
cp --update ~/.gitconfig ./.gitconfig
cp --update ~/.haskeline ./.haskeline
cp --update ~/.xmobarrc ./.xmobarrc
cp --update ~/.zshrc ./.zshrc
