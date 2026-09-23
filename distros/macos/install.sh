#!/usr/bin/env bash
# /!\ This script won't do backup /!\
set -euxo pipefail

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install kitty bash zsh bat eza tree wget
brew install htop btop ncdu fastfetch
brew install git tig lazygit git-gui repo
brew install cmake make ccache
brew install font-dejavu-sans-mono-nerd-font

brew install helix neovim meld
brew install gimp blockbench

# brew install qt
# brew install ncurses
# brew install dart-sdk
# brew install dotnet-sdk
# brew install openjdk maven
# brew install openssl@1.1 repo
