# MacBook Pro M4 Max Development Setup

A comprehensive dotfiles repository to set up your new MacBook Pro M4 Max for development work.

## 🚀 What This Setup Installs

### Core Development Tools
- **Android Studio** - Android development IDE
- **Cursor Editor** - AI-powered code editor
- **Visual Studio Code** - Microsoft's code editor
- **Xcode** - iOS/macOS development tools

### Android Development Tools
- **Android Platform Tools** - ADB, fastboot, and SDK tools
- **Scrcpy** - Screen mirroring and control
- **Genymotion** - Android emulator
- **Charles Proxy** - Network debugging
- **Wireshark** - Network analysis
- **Burp Suite** - Security testing
- **APKTool** - APK analysis and manipulation
- **Dex2Jar** - APK to JAR conversion
- **JD-GUI** - Java decompiler
- **Proxyman** - Network debugging

### Flutter Development Tools
- **Flutter SDK** - Cross-platform UI framework
- **Dart** - Programming language
- **FVM** - Flutter version management
- **Codemagic** - CI/CD for Flutter
- **Firebase CLI** - Firebase tools
- **Firebase Emulator** - Local development

### KMM Development Tools
- **Kotlin** - Programming language
- **Kotlin/Native** - Native compilation 

### Browsers
- **Brave Browser** - Privacy-focused browser
- **Google Chrome** - Standard web browser

### Communication & Productivity
- **Slack** - Team communication
- **1Password** - Password management
- **Zoom** - Video conferencing
- **Spotify** - Music streaming

### Development Environment
- **Homebrew** - Package manager
- **Node.js & npm** - JavaScript runtime
- **Python 3** - Python programming language
- **Git** - Version control
- **Oh My Zsh** - Shell framework

### Database Tools
- **SQLite Browser** - SQLite database management
- **Realm Studio** - Realm database management

### Additional Tools
- **Rectangle** - Window management
- **Caffeine** - Prevent sleep
- **AppCleaner** - App cleanup
- **The Unarchiver** - Archive extraction
- **Proxyman** - Network debugging
- **iTerm2** - Terminal emulator
- **Vim** - Command line editor

## 📋 Prerequisites

- macOS (designed for Apple Silicon Macs)
- Administrator privileges
- Internet connection

## 🛠️ Quick Setup

### Option 1: Run the main installer
```bash
# Clone this repository
git clone <your-repo-url>
cd my-android-dot

# Make scripts executable
chmod +x install.sh
chmod +x macos-prefs.sh

# Run the main installer
./install.sh
```

### Option 2: Use Homebrew Bundle
```bash
# Install all packages from Brewfile
brew bundle
```

### Option 3: Manual installation
```bash
# Install Homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then run individual scripts as needed
./macos-prefs.sh
```

## 📁 Repository Structure

```
my-android-dot/
├── install.sh              # Main installation script
├── macos-prefs.sh          # macOS preferences configuration
├── Brewfile                # Homebrew packages list
├── .zshrc                  # Zsh shell configuration
├── .gitconfig              # Git configuration
├── .gitignore_global       # Global Git ignore rules
├── requirements.txt         # Python packages
├── package.json            # Node.js global packages
└── README.md               # This file
```

## 🔧 Configuration Files

### Shell Configuration (.zshrc)
- Oh My Zsh with development plugins
- Custom aliases for Git, Python, Node.js
- Environment variables for development tools
- Android SDK and Flutter paths

### Git Configuration (.gitconfig)
- Comprehensive Git aliases
- Editor preferences
- Branch naming conventions
- LFS configuration

### macOS Preferences
- Dock customization
- Finder settings
- Trackpad and keyboard preferences
- Development app configurations

## 🎯 Dock Configuration

The setup automatically configures your dock with:
1. Calendar
2. Google Chrome
3. Visual Studio Code
4. Android Studio
5. Slack
6. Spotify
7. Cursor Editor
8. Brave Browser
9. 1Password
10. Zoom
11. SQLite Browser
12. Realm Studio

## 🔧 Mobile Development Features

### Android Development
- **ADB & Fastboot** - Device management and debugging
- **APKTool** - APK analysis and manipulation
- **Scrcpy** - Screen mirroring and control
- **Frida** - Dynamic instrumentation

### Flutter Development
- **Flutter SDK** - Cross-platform development
- **Dart** - Programming language
- **FVM** - Version management
- **Firebase** - Backend services

### KMM Development
- **Kotlin** - Multiplatform development
- **Gradle** - Build automation
- **Maven** - Dependency management
- **IntelliJ IDEA** - IDE support

### Useful Aliases
- `adb-devices` - List connected devices
- `adb-logcat` - Filtered logcat output
- `adb-install <apk>` - Install APK file
- `apk-analyze <apk>` - Decompile APK for analysis
- `apk-security <apk>` - Security analysis of APK
- `flutter-create <name>` - Create Flutter project
- `flutter-run <device>` - Run Flutter app
- `kmm-create <name>` - Create KMM project structure

### Directory Structure
- `~/Documents/AndroidStudioProjects/` - Android Studio projects
- `~/Documents/FlutterProjects/` - Flutter projects
- `~/Documents/KMMProjects/` - KMM projects
- `~/Android/Sdk/` - Android SDK
- `~/Android/AVD/` - Android Virtual Devices
- `~/Android/APKs/` - APK files
- `~/.pub-cache/` - Flutter package cache
- `~/.gradle/` - Gradle cache

## 🐍 Python Setup

Installs Python 3.11 with essential packages:
- Web development (Flask, Django, FastAPI)
- Data science (pandas, numpy, matplotlib)
- Testing (pytest, coverage tools)
- Code quality (black, flake8, mypy)
- **Android development tools** (androguard, apkleaks, frida-tools, objection)

## 📦 Node.js Setup

Installs global packages for:
- Development tools (TypeScript, ESLint, Prettier)
- Framework CLIs (React, Next.js, Vue, Angular)
- Build tools (Webpack, Vite, Parcel)
- Testing (Jest, Cypress, Playwright)

## 🔐 Security Features

- Automatic security updates
- Screen saver password protection
- Secure Git configuration
- 1Password integration

## 🚨 Troubleshooting

### Common Issues

**Homebrew not found after installation:**
```bash
# For Apple Silicon Macs
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
source ~/.zprofile
```

**Permission denied errors:**
```bash
# Make scripts executable
chmod +x *.sh
```

**Dock not updating:**
```bash
# Restart dock manually
killall Dock
```

### Manual Package Installation

If automatic installation fails:
```bash
# Install specific packages
brew install --cask android-studio
brew install --cask cursor
brew install --cask visual-studio-code
```

## 🔄 Updating

### Update Homebrew packages:
```bash
brew update && brew upgrade
```

### Update global Node.js packages:
```bash
npm update -g
```

### Update Python packages:
```bash
pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U
```

## 📚 Additional Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Android Studio Setup](https://developer.android.com/studio)
- [Cursor Editor](https://cursor.sh/)
- [macOS Terminal Guide](https://support.apple.com/guide/terminal/)

## 🤖 Mobile Development Verification

After installation, verify your development environment:

```bash
# Check Android SDK tools
adb version
fastboot version
apktool version

# Check Flutter
flutter --version
dart --version
fvm --version

# Check KMM tools
kotlin --version
gradle --version
mvn --version

# Check Python tools
python3 -c "import androguard; print('Androguard installed')"
python3 -c "import firebase_admin; print('Firebase Admin installed')"

# Check IDEs
open -a "Android Studio"
```

### Essential Development Workflows

#### Android Development
1. **Device Setup**: Connect device via USB, enable debugging
2. **APK Analysis**: Use `apk-analyze` for reverse engineering
3. **Network Debugging**: Use Proxyman for API testing
4. **Performance**: Monitor with Android Studio Profiler

#### Flutter Development
1. **Project Creation**: Use `flutter-create <name>` for new projects
2. **Device Management**: Use `flutter devices` to see available devices
3. **Building**: Use `flutter-build <platform>` for releases
4. **Firebase Integration**: Use Firebase CLI and emulator

#### KMM Development
1. **Project Structure**: Use `kmm-create <name>` for new projects
2. **Shared Module**: Develop common Kotlin code
3. **Platform Modules**: Build Android and iOS specific code
4. **Build Automation**: Use Gradle for multi-platform builds

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

MIT License - feel free to use this setup for your own development environment.

---

**Note:** This setup is specifically designed for macOS and Apple Silicon Macs. Some features may not work on Intel Macs or other operating systems.
