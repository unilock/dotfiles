#!/bin/sh
source functions/common

print_line "Setting MOTD."

sudo echo "Welcome to Darwin!" > /private/etc/motd
