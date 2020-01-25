#!/bin/sh
source functions/common

print_line "Setting shell for $(whoami) to zsh."
sudo chsh -s /bin/zsh $(whoami)
