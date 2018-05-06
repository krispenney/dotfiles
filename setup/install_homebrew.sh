#!/bin/sh

# Install HomeBrew
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew..."

  curl -fsS \
     'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
  export PATH="/usr/local/bin:$PATH"
else
  echo "Homebrew installed!"
fi

brew update && brew install `brew outdated`

echo "Installing Packages:"

brew install openssl
brew install graphviz
brew install python3

brew install wget

echo "-   Installing vim..."
brew install vim

echo "-   Installing tmux..."
brew install tmux
brew install reattach-to-user-namespace

brew install thefuck

echo "-   Installing command line completions"
brew install zsh
brew install zsh-completions
brew install bash
brew install bash-completion

echo "-   Installing Apps..."

brew tap caskroom/cask
brew cask install iterm2
brew cask install caffeine
brew cask install postman
brew cask install vlc
brew cask install spotify
