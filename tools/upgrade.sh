#!/bin/bash

if ! xcode-select -p >/dev/null; then
    echo "[INFO] Running 'xcode-select --install'"
    xcode-select --install
    read -rsp "Press enter to continue..."
fi

echo "[INFO] Running 'brew update'"
brew update

echo "[INFO] Running 'brew upgrade --formula --fetch-HEAD'"
brew upgrade --formula --fetch-HEAD

echo "[INFO] Running 'brew upgrade --cask'"
brew upgrade --cask

echo "[INFO] Running 'brew cleanup'"
brew cleanup

echo "[INFO] Checking for software updates"
swupd_err=$(softwareupdate -l 2>&1)
if [[ "$swupd_err" == *"No new software available."* ]]; then
    echo "[INFO] No new software updates available."
elif [[ "$swupd_err" == *"Software Update found the following new or updated software:"* ]]; then
    echo "[INFO] Software updates found! Would you like to install them?"
    echo "$swupd_err" | awk '/\*/{c=2}c&&c--' #cursed
    read -p "(Y/N)? " ans
    if [[ "$ans" == "yes" ]] || [[ "$ans" == "y" ]]; then
        echo "[INFO] Installing software updates! This may take a while..."
        softwareupdate -ia --no-scan #we already scanned for updates
    fi
else
    echo "[ERROR] Unexpected output from 'softwareupdate'!"
    echo "$swupd_err"
fi

echo "[INFO] Done!"
