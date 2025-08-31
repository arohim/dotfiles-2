#!/bin/bash

# MacBook Pro M4 Max Setup Script
# This script installs and configures all necessary software for development

set -e

echo "🚀 Starting MacBook Pro M4 Max setup..."

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is designed for macOS only"
    exit 1
fi

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew already installed"
fi

# Update Homebrew
echo "🔄 Updating Homebrew..."
brew update

# Install command line tools
echo "🛠️ Installing command line tools..."
xcode-select --install || true

# Install core development tools
echo "📚 Installing development tools..."
brew install git node python@3.11 sqlite

# Install GUI applications
echo "🖥️ Installing GUI applications..."

# Android Studio
if ! [ -d "/Applications/Android Studio.app" ]; then
    echo "📱 Installing Android Studio..."
    brew install --cask android-studio
fi

# Cursor Editor
if ! [ -d "/Applications/Cursor.app" ]; then
    echo "✏️ Installing Cursor Editor..."
    brew install --cask cursor
fi

# Visual Studio Code
if ! [ -d "/Applications/Visual Studio Code.app" ]; then
    echo "💻 Installing Visual Studio Code..."
    brew install --cask visual-studio-code
fi

# Brave Browser
if ! [ -d "/Applications/Brave Browser.app" ]; then
    echo "🦁 Installing Brave Browser..."
    brew install --cask brave-browser
fi

# Google Chrome
if ! [ -d "/Applications/Google Chrome.app" ]; then
    echo "🌐 Installing Google Chrome..."
    brew install --cask google-chrome
fi

# Spotify
if ! [ -d "/Applications/Spotify.app" ]; then
    echo "🎵 Installing Spotify..."
    brew install --cask spotify
fi

# Slack
if ! [ -d "/Applications/Slack.app" ]; then
    echo "💬 Installing Slack..."
    brew install --cask slack
fi

# 1Password
if ! [ -d "/Applications/1Password.app" ]; then
    echo "🔐 Installing 1Password..."
    brew install --cask 1password
fi

# Zoom
if ! [ -d "/Applications/zoom.us.app" ]; then
    echo "📹 Installing Zoom..."
    brew install --cask zoom
fi

# SQLite Browser
if ! [ -d "/Applications/DB Browser for SQLite.app" ]; then
    echo "🗄️ Installing SQLite Browser..."
    brew install --cask db-browser-for-sqlite
fi

# Realm Studio
if ! [ -d "/Applications/Realm Studio.app" ]; then
    echo "🔮 Installing Realm Studio..."
    brew install --cask realm-studio
fi

# Install dockutil for dock customization
echo "⚓ Installing dockutil..."
brew install dockutil

# Configure dock
echo "🎯 Configuring dock..."
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Android Studio.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/Cursor.app"
dockutil --no-restart --add "/Applications/Brave Browser.app"
dockutil --no-restart --add "/Applications/1Password.app"
dockutil --no-restart --add "/Applications/zoom.us.app"
dockutil --no-restart --add "/Applications/DB Browser for SQLite.app"
dockutil --no-restart --add "/Applications/Realm Studio.app"

# Restart dock
killall Dock

# Install Oh My Zsh
if ! [ -d "$HOME/.oh-my-zsh" ]; then
    echo "🐚 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install additional tools
echo "🔧 Installing additional tools..."
brew install --cask rectangle      # Window management
# brew install --cask alfred         # Spotlight replacement
brew install --cask caffeine       # Prevent sleep
brew install --cask appcleaner     # App cleanup
brew install --cask the-unarchiver # Archive extraction
brew install --cask proxyman       # Network debugging
brew install --cask iterm2         # Terminal emulator
brew install vim                    # Command line editor

# Install development tools
echo "⚙️ Installing development tools..."
brew install --cask postman         # API testing
brew install --cask docker          # Containerization
brew install --cask mongodb-compass # MongoDB GUI

# Install Android development specific tools
echo "🤖 Installing Android development tools..."
brew install --cask android-platform-tools  # ADB and fastboot
brew install --cask android-file-transfer   # File transfer
brew install --cask scrcpy                   # Screen mirroring
brew install --cask genymotion               # Android emulator
# brew install --cask charles                  # Network proxy for debugging
# brew install --cask wireshark                # Network analysis
# brew install --cask burp-suite               # Security testing
brew install --cask apktool                  # APK analysis
brew install --cask dex2jar                  # APK to JAR conversion
brew install --cask jd-gui                   # Java decompiler

# Install Flutter development tools
echo "🦋 Installing Flutter development tools..."
brew install --cask flutter                  # Flutter SDK
brew install --cask dart                     # Dart programming language
brew install --cask fvm                      # Flutter version management
# brew install --cask codemagic                # CI/CD for Flutter
brew install --cask firebase-cli             # Firebase tools
brew install --cask firebase-emulator        # Firebase local emulator

# Install KMM development tools
echo "📱 Installing KMM development tools..."
brew install --cask kotlin                   # Kotlin compiler
brew install --cask kotlin-native            # Kotlin/Native
# brew install --cask gradle                    # Build tool
# brew install --cask maven                     # Dependency management
# brew install --cask intellij-idea-ce         # IntelliJ IDEA Community
# brew install --cask android-studio-preview   # Android Studio Preview (for latest features)

# Configure Git
echo "🔧 Configuring Git..."
if ! git config --global user.name &> /dev/null; then
    echo "Please configure Git with your details:"
    read -p "Enter your name: " git_name
    read -p "Enter your email: " git_email
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
fi

# Install Python packages
echo "🐍 Installing Python packages..."
pip3 install --upgrade pip
pip3 install requests beautifulsoup4 pandas numpy matplotlib jupyter

# Install Node.js packages
echo "📦 Installing Node.js packages..."
npm install -g yarn typescript ts-node nodemon

# Install Android development Python packages
echo "🐍 Installing Android development Python packages..."
pip3 install androguard          # APK analysis
pip3 install apkleaks            # APK security analysis
pip3 install apktool             # APK manipulation
# pip3 install frida-tools         # Dynamic instrumentation
# pip3 install objection            # Runtime mobile exploration

# Install Flutter development Python packages
echo "🐍 Installing Flutter development Python packages..."
pip3 install firebase-admin      # Firebase admin SDK
pip3 install google-cloud-storage # Google Cloud Storage
pip3 install google-auth         # Google authentication
pip3 install requests-oauthlib   # OAuth for API calls

# Create development directories
echo "📁 Creating development directories..."
mkdir -p ~/Projects
mkdir -p ~/Documents/Development
mkdir -p ~/Downloads/Development
mkdir -p ~/Documents/AndroidStudioProjects
mkdir -p ~/Android
mkdir -p ~/Android/Sdk
mkdir -p ~/Android/AVD
mkdir -p ~/Android/Logs
mkdir -p ~/Android/APKs
mkdir -p ~/Android/Backups

# Create Flutter development directories
echo "📁 Creating Flutter development directories..."
mkdir -p ~/Documents/FlutterProjects
mkdir -p ~/Documents/FlutterProjects/Apps
mkdir -p ~/Documents/FlutterProjects/Packages
mkdir -p ~/Documents/FlutterProjects/Plugins
mkdir -p ~/.pub-cache
mkdir -p ~/.pub-cache/bin

# Create KMM development directories
echo "📁 Creating KMM development directories..."
mkdir -p ~/Documents/KMMProjects
mkdir -p ~/Documents/KMMProjects/Shared
mkdir -p ~/Documents/KMMProjects/Android
mkdir -p ~/Documents/KMMProjects/iOS
mkdir -p ~/.gradle
mkdir -p ~/.m2

echo "✅ Setup complete! Your MacBook Pro M4 Max is ready for development."
echo "🔄 Please restart your computer to ensure all changes take effect."
