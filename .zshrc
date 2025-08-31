# MacBook Pro M4 Max .zshrc Configuration

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    node
    npm
    python
    macos
)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Development aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gco='git checkout'
alias gcb='git checkout -b'

# Python aliases
alias python='python3'
alias pip='pip3'
alias py='python3'

# Node.js aliases
alias n='node'
alias nr='npm run'
alias ni='npm install'
alias nid='npm install --save-dev'
alias nis='npm install --save'

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'

# Android development aliases
alias adb='adb'
alias fastboot='fastboot'
alias apktool='apktool'
alias dex2jar='dex2jar'
alias jd='jd-gui'
alias scrcpy='scrcpy'
alias genymotion='genymotion'
alias charles='charles'
alias wireshark='wireshark'
alias burp='burp-suite'
alias apkleaks='apkleaks'
alias frida='frida'
alias objection='objection'

# macOS specific
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias cleanup='sudo rm -rf /private/var/log/asl/*.asl'

# Functions
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function weather() {
    curl "wttr.in/$1"
}

# Android development functions
function adb-devices() {
    adb devices -l
}

function adb-logcat() {
    adb logcat | grep -E "(AndroidRuntime|FATAL|ERROR|WARN)"
}

function adb-install() {
    if [ -z "$1" ]; then
        echo "Usage: adb-install <apk-file>"
        return 1
    fi
    adb install -r "$1"
}

function adb-uninstall() {
    if [ -z "$1" ]; then
        echo "Usage: adb-uninstall <package-name>"
        return 1
    fi
    adb uninstall "$1"
}

function adb-shell() {
    adb shell
}

function adb-pull() {
    if [ -z "$2" ]; then
        echo "Usage: adb-pull <remote-path> <local-path>"
        return 1
    fi
    adb pull "$1" "$2"
}

function adb-push() {
    if [ -z "$2" ]; then
        echo "Usage: adb-push <local-path> <remote-path>"
        return 1
    fi
    adb push "$1" "$2"
}

function apk-analyze() {
    if [ -z "$1" ]; then
        echo "Usage: apk-analyze <apk-file>"
        return 1
    fi
    apktool d "$1" -o "${1%.apk}_decompiled"
    echo "APK decompiled to: ${1%.apk}_decompiled"
}

function apk-security() {
    if [ -z "$1" ]; then
        echo "Usage: apk-security <apk-file>"
        return 1
    fi
    apkleaks -f "$1"
}

# Environment variables
export EDITOR='cursor'
export VISUAL='cursor'
export BROWSER='brave-browser'

# Node.js version management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Python virtual environment
export PYTHONPATH="${PYTHONPATH}:${HOME}/Projects"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME=$HOME/Android/AVD
export ANDROID_EMULATOR_HOME=$HOME/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Flutter
export PATH=$PATH:$HOME/flutter/bin

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Auto-completion
autoload -Uz compinit
compinit

# Key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Welcome message
echo "🚀 Welcome to your MacBook Pro M4 Max Android development environment!"
echo "📱 Android Studio, Cursor, and all development tools are ready to use."
echo "🔧 Android-specific aliases: adb-devices, adb-logcat, apk-analyze, apk-security"
echo "💡 Type 'help' for available commands or check the README.md"
