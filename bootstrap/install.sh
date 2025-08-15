#!/usr/bin/env bash
set -euo pipefail

DOT="$HOME/dotfiles"
mkdir -p "$HOME/.config/zsh"

ln -snf "$DOT/zsh/zshrc" "$HOME/.zshrc"
ln -snf "$DOT/zsh"/* "$HOME/.config/zsh"

echo "Done."
