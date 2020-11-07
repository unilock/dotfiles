#!/bin/bash
source functions/common

print_line "Setting up the environment."

# Set motd
./scripts/set-motd.sh

# Copy dotfiles to home
./scripts/install-dotfiles.sh

# Set the default shell to zsh
./scripts/set-shell-to-zsh.sh

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

# # Start services
# ./scripts/start-services.sh

# # Restart userspace
#./scripts/restart-userspace.sh

print_line "Done. A reboot is recommended."
