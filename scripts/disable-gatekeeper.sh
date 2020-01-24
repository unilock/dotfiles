#!/bin/sh
source functions/common

# Bite me.
print_line "Disabling Gatekeeper."
sudo spctl --master-disable