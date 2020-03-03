#!/bin/bash
source functions/common

print_line "Setting up the environment."

# Copy dotfiles to home
./scripts/install-dotfiles.sh

# Set the default shell to zsh
./scripts/set-shell-to-zsh.sh

# Disable Gatekeeper
./scripts/disable-gatekeeper.sh

# Install homebrew
./scripts/install-homebrew.sh

# Install homebrew packages
./scripts/install-homebrew-packages.sh

# Set sane defaults
./scripts/defaults-write.sh

# # Remap keyboard settings
# ./scripts/remap-keyboard.sh

# Set up applications
./scripts/defaults-app-write.sh

# Create and install the Root FS overlay root
./scripts/install-rootfs-overlay.sh

# # Start services
# ./scripts/start-services.sh

# Restart userspace
./scripts/restart-userspace.sh
