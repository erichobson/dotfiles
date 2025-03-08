# bin/bash

# Install Xcode Command Line Tools before running
xcode-select --install

#
export ZDOTDIR="$HOME/.config/zsh"
export BUILD="$HOME/.build"

# Create directories
mkdir -p $BUILD

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ninja cmake gettext curl node

# brew install jordanbaird-ice                    # Ice
# brew install hugo                               # Hugo
# brew install tailscale                          # Tailscale
# brew install --cask lookaway                    # LookAway
# brew install --cask nikitabobko/tap/aerospace   # Aerospace
# brew install --cask iterm2                      # iTerm2
# brew install --cask raycast                     # Raycast
# brew install --cask arc                         # Arc Browser
# brew install --cask 1password                   # 1Password
# brew install --cask obsidian                    # Obsidian
# brew install lsd
# brew install --cask keymapp                     # Keymapp
# brew install --cask spotify
# brew install --cask discord
# brew tap FelixKratz/formulae
# brew install --cask sf-symbols

# Install Neovim
# git clone https://github.com/neovim/neovim.git $BUILD/neovim
# cd $BUILD/neovim
# make CMAKE_BUILD_TYPE=Release
# sudo make install

# Install Antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git $ZDOTDIR/.antidote
ln -s $ZDOTDIR/.zshenv ~/.zshenv

