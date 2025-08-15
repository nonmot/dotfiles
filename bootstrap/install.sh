#!/usr/bin/env bash
set -euo pipefail

DOT="$HOME/dotfiles"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$HOME/.config/zsh"

# zsh
ln -snf "$DOT/zsh/zshrc" "$HOME/.zshrc"
ln -snf "$DOT/zsh"/* "$HOME/.config/zsh"

# nvim
mkdir -p "$XDG_CONFIG_HOME"
ln -snf "$DOT/nvim" "$XDG_CONFIG_HOME/nvim"

# tmux
ln -snf "$DOT/tmux.conf" "$HOME/.tmux.conf"

# Homebrew
ln -snf "$DOT/Brewfile" "$HOME/.Brewfile"

echo "Done."
