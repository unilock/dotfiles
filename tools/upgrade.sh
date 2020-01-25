#!/bin/bash

echo "[INFO] Running 'brew update'"
brew update

echo "[INFO] Running 'brew upgrade --fetch-HEAD'"
brew upgrade --fetch-HEAD

echo "[INFO] Running 'brew cask upgrade'"
brew cask upgrade

echo "[INFO] Running 'brew cleanup'"
brew cleanup

echo "[INFO] Checking for software updates"
swupd_err=$(softwareupdate -l 2>&1 1>/dev/null)
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