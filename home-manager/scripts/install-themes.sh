#!/usr/bin/env sh
TMP_DIR="/tmp/themes"

# Gtk theme
THEME_DIR="$HOME/.local/share/themes/adw-gtk3"
mkdir -p "$THEME_DIR"
mkdir -p "${THEME_DIR}-dark"
mkdir -p "$TMP_DIR"

wget2 -v "https://github.com/lassekongo83/adw-gtk3/releases/download/v6.5/adw-gtk3v6.5.tar.xz" -P "$TMP_DIR"
tar xvf "$TMP_DIR/adw-gtk3v6.5.tar.xz" -C "$TMP_DIR"

cpx -v "$TMP_DIR/adw-gtk3"/* -t "$THEME_DIR"
cpx -v "$TMP_DIR/adw-gtk3-dark"/* -t "${THEME_DIR}-dark"
rm -rf "$TMP_DIR"

# Icon theme
wget2 -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.local/share/icons" sh
wget2 -qO- https://git.io/papirus-folders-install | env PREFIX="$HOME/.local" sh
