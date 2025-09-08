#!/bin/bash

# macOS Preferences Configuration Script
# This script configures various macOS settings for better development experience

echo "🔧 Configuring macOS preferences..."

# Dock preferences
echo "⚓ Configuring Dock..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock show-recents -bool true
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 64

# Finder preferences
echo "📁 Configuring Finder..."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder SidebarWidth -int 200
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Desktop preferences
echo "🖥️ Configuring Desktop..."
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

# System preferences
echo "⚙️ Configuring System preferences..."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write com.apple.sound.beep.volume -float 0.0
defaults write com.apple.sound.beep.feedback -int 0

# Trackpad preferences
echo "👆 Configuring Trackpad..."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Keyboard preferences
echo "⌨️ Configuring Keyboard..."
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Mission Control preferences
echo "🚀 Configuring Mission Control..."
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

# Security preferences
echo "🔒 Configuring Security..."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Network preferences
echo "🌐 Configuring Network..."
defaults write com.apple.networkuse AllowNetInstall -bool false

# Time Machine preferences
echo "⏰ Configuring Time Machine..."
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# App Store preferences
echo "🛍️ Configuring App Store..."
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# Safari preferences
echo "🌐 Configuring Safari..."
defaults write com.apple.Safari ShowFavoritesBar -bool false
defaults write com.apple.Safari ShowSidebarInTopSites -bool false
defaults write com.apple.Safari ShowStatusBar -bool true
defaults write com.apple.Safari ShowTabBar -bool true

# Terminal preferences
echo "💻 Configuring Terminal..."
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# Xcode preferences
echo "📱 Configuring Xcode..."
defaults write com.apple.dt.Xcode DVTTextShowInvisibleCharacters -bool true
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 120

# Android Studio preferences
echo "🤖 Configuring Android Studio..."
defaults write com.google.android.studio NSNavLastRootDirectory -string "~/Projects"
defaults write com.google.android.studio NSNavLastRootDirectoryMode -int 1

# Cursor preferences
echo "✏️ Configuring Cursor..."
defaults write com.cursor.Cursor NSNavLastRootDirectory -string "~/Projects"
defaults write com.cursor.Cursor NSNavLastRootDirectoryMode -int 1

# Restart affected applications
echo "🔄 Restarting affected applications..."
killall Dock
killall Finder
killall SystemUIServer

echo "✅ macOS preferences configured successfully!"
echo "🔄 Some changes may require a restart to take full effect."
