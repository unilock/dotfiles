#!/bin/sh
source functions/common

print_line "Setting up upgrade script..."
ln -s ~/Projects/dotfiles/tools/upgrade.sh ~/
chmod +x ~/upgrade.sh

print_line "Copying default settings files..."

# Copy my gitconfigs...
ditto -v dotfiles/gitconfig ~/.gitconfig
ditto -v .gitignore ~/.gitignore
# ditto -v dotfiles/clang-format ~/.clang-format

# Copy over zsh settings
ditto -v dotfiles/zshrc ~/.zshrc
