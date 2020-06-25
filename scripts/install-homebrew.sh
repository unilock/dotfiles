#!/bin/sh
source functions/common

print_line "Installing Homebrew."

# Install homebrew.
if [ ! -f /usr/local/bin/brew ]; then
    # Do the homebrew thing.
    # NOTE: homebrew will install Command Line Tools for us.
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi