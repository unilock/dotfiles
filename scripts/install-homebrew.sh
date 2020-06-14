#!/bin/sh
source functions/common

print_line "Installing Homebrew."

# Install homebrew.
if [ ! -f /usr/local/bin/brew ]; then
    # TODO: Figure out how to do this headlessly.
    print_line "Installing Command Line Tools and accepting user license."
    sudo xcode-select --install
    sudo xcodebuild -license accept

    # Do the homebrew thing.
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi