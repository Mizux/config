#!/usr/bin/env bash

# /!\ This script won't do backup /!\
set -euxo pipefail


bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install bash zsh bat eza htop tree wget
brew install btop ncdu fastfetch
brew install git tig git-gui cmake make ccache
brew install font-dejavu-sans-mono-nerd-font

brew install helix

# brew install dart-sdk
# brew install dotnet-sdk
# brew install openjdk
# brew install openssl@1.1 repo

# Shell
cp zshrc ~/.zshrc

# Git
cp gitconfig ~/.gitconfig
