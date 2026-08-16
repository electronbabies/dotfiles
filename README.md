# Dotfiles

Personal configuration for my Linux development environment.

These files are used to keep my development setup reproducible across machines and serve as the source of truth for the tools and workflows I use day to day.

## Environment

- Fedora Linux
- Hyprland
- Neovim / LazyVim
- tmux
- Zsh / Oh My Zsh
- Waybar
- Powerlevel10k
- zoxide
- eza

## Repository Structure

```text
.
├── .config/
│   ├── hypr/       # Hyprland configuration
│   ├── nvim/       # Neovim / LazyVim configuration
│   └── waybar/     # Waybar configuration and styling
├── bin/            # Personal command-line utilities
├── .bashrc
├── .zshrc
└── install.sh
```

## Installation

The included installation script symlinks the tracked configuration into the appropriate locations in the home directory.

Existing files and directories are backed up before being replaced.

```bash
git clone git@github.com:electronbabies/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
./install.sh
```

This repository is primarily maintained for my own environment and may make assumptions about installed software, paths, and system configuration.

## Documentation

Additional notes about the development environment, tools, keybindings, and workflows are maintained in my [development environment documentation](https://github.com/electronbabies/dev-environment-docs).
