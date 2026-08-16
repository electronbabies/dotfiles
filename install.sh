#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link_item() {
  local source="$1"
  local target="$2"

  if [ ! -e "$source" ]; then
    echo "Skipping missing source: $source"
    return
  fi

  if [ -L "$target" ]; then
    echo "Removing existing symlink: $target"
    rm "$target"
  elif [ -e "$target" ]; then
    echo "Backing up existing file/directory: $target"
    mkdir -p "$BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/"
  fi

  mkdir -p "$(dirname "$target")"

  echo "Linking: $target -> $source"
  ln -s "$source" "$target"
}

echo "Installing dotfiles from: $DOTFILES_DIR"

# ~/.config apps
link_item "$DOTFILES_DIR/.config/hypr" "$HOME/.config/hypr"
link_item "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
link_item "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_item "$DOTFILES_DIR/.config/waybar" "$HOME/.config/waybar"

# home files
link_item "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_item "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo
echo "Done."
echo "Backups, if any, are in: $BACKUP_DIR"

echo
echo "✔ Installation complete."
echo
echo "Backups: $BACKUP_DIR"
echo
echo "Next steps:"
echo "  git status"
echo "  hyprctl reload"
