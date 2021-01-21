#!/bin/sh
source functions/common

print_line "Setting default settings."

print_line " - Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

print_line " - Show all extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

print_line " - Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

print_line " - Disable auto-capitalization"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

print_line " - Disable period substitution"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

print_line " - Disable quote substitution"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

print_line " - Disable dash substitution"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

print_line " - Enable trackpad silent clicking"
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

print_line " - Enable trackpad force clicking"
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true

print_line " - Enable trackpad force clicking haptic feedback"
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 1
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -int 0

print_line " - Enable trackpad tap to click"
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

print_line " - Enable trackpad double-tap to drag"
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true

print_line " - Enable sane trackpad scrolling"
defaults write com.apple.AppleMultitouchMouse MouseHorizontalScroll -int 1
defaults write com.apple.AppleMultitouchMouse MouseVerticalScroll -int 1
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

print_line " - Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

print_line " - Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# print_line " - Mission control: group by app"
# defaults write com.apple.dock expose-group-apps -bool true
# defaults write com.apple.dock expose-group-by-app -bool true

print_line " - Disable dock resizing"
defaults write com.apple.Dock size-immutable -bool true

print_line " - Hide recent apps"
defaults write com.apple.dock show-recents -bool false

# print_line " - Hot corner settings"
# # Top left screen corner
# defaults write com.apple.dock wvous-tl-corner   -int 11
# defaults write com.apple.dock wvous-tl-modifier -int 0
# # Top right screen corner
# defaults write com.apple.dock wvous-tr-corner   -int 12
# defaults write com.apple.dock wvous-tr-modifier -int 0
# # Bottom left screen corner
# defaults write com.apple.dock wvous-bl-corner   -int 2
# defaults write com.apple.dock wvous-bl-modifier -int 0
# # Bottom right screen corner
# defaults write com.apple.dock wvous-br-corner   -int 5
# defaults write com.apple.dock wvous-br-modifier -int 0

print_line " - Expand save panels by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

print_line " - No more resume"
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

print_line " - Password required after screensaver"
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0

print_line " - Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

print_line " - Go away Siri"
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

print_line " - Give me the volume feedback back"
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true

print_line " - Make Desktop tolerable"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

print_line " - Make Finder tolerable"
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "icnv" # Icon View
defaults write com.apple.finder NewWindowTarget -string 'PfCm' # Computer

print_line " - Make Disk Utility tolerable"
defaults write com.apple.DiskUtility advanced-image-options -bool true
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true

print_line " - Shut up Time Machine"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

print_line " - Use superior temperature system"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

print_line " - .DS_Store, go away"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
find / -name '.DS_Store' -delete >/dev/null 2>&1

print_line " - Hide text input menu"
defaults write com.apple.TextInputMenu visible -bool false

print_line " - User switcher in menubar"
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" -bool true

print_line " - Bluetooth in menubar"
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

print_line " - Volume in menubar"
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true

print_line " - Make menubar clock informative"
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm:ss a"

print_line " - Don't automatically sync my MP3 player from 2001"
defaults write com.apple.AMPDevicesAgent dontAutomaticallySyncIPods -bool true

print_line " - Let's wipe the dock"
defaults write com.apple.dock persistent-apps -array
