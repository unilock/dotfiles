#!/bin/sh
source functions/common

# Install long list of packages.
IFS=$'\n'

print_line "Adding Homebrew taps."
cat lists/brew-taps | while read line || [[ -n $line ]]; do
    brew tap $line
done

print_line "Installing Homebrew packages."
cat lists/brew-packages | xargs brew install

print_line "Installing Homebrew packages with --HEAD."
cat lists/brew-head-packages | xargs brew install --HEAD

print_line "Installing Homebrew cask packages."
cat lists/brew-cask-packages | xargs brew install --cask

print_line "Installing App Store applications."
cat lists/mas-app-ids | xargs mas install
