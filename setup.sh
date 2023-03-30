#!/usr/bin/env bash

# update OS & tools
sudo softwareupdate --install-rosetta --agree-to-license
# Ignore: "Package Authoring Error: 012-51699: Package reference com.apple.pkg.RosettaUpdateAuto is missing installKBytes attribute"
xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/dmadouros/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

# install my favorite unix utils
brew install cowsay
brew install curl
brew install direnv
brew install fortune
brew install gh
brew install git
brew install gnu-sed
brew install gnu-typist
brew install jq
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install tree
brew install wget
brew install vim

# java/kotlin ecosystem
brew install ktlint

# node ecosystem
brew install nvm

# browsers
brew install -q --cask google-chrome

# applications
brew install --cask slack
brew install --cask zoom
brew install --cask rectangle
brew install --cask 1password
brew install --cask iterm2
brew install --cask alfred
brew install --cask postman
brew install --cask docker
brew install --cask krisp
brew install -q --cask sublime-text
brew install -q --cask intellij-idea
brew install -q --cask webstorm
brew install -q --cask caffeine
brew install -q --cask dropbox
brew install --cask cleanmymac
brew install --cask gemini
brew install --cask guitar-pro
brew install --cask tuple
brew install --cask discord
brew install --cask battle-net
brew install --cask omnifocus
brew install --cask notion
brew install --cask jetbrains-toolbox

# app store apps
brew install mas
mas install 890031187 # Marked 2
mas install 447661441 # xScope

# set menu clock
defaults write com.apple.menuextra.clock "DateFormat" 'EEE MMM d  h:mm:ss a'
killall SystemUIServer

# stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# set keyboard to use function keys
defaults write "Apple Global Domain" "com.apple.keyboard.fnState" -int 1

# finder
# show full path in finder title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true
# finder opens to home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
# allow finder to be closed with cmd-Q
defaults write com.apple.finder QuitMenuItem -bool true

# Add home and workstation to finder sidebar, remove others
brew install mysides 
mysides add Home file:///Users/dmadouros
mysides add Work file:///Users/dmadouros/work
mysides remove Recents
mysides remove Applications
mysides remove Desktop
mysides remove Documents
mysides remove Downloads

# dock
defaults write com.apple.dock autohide -bool true
killall Dock

# git
cp support/git/gitconfig /Users/dmadouros/.gitconfig

# vim
cp support/vim/vimrc /Users/dmadouros/.vimrc

# iTerm
# disable prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool true
# "import" settings
cp com.googlecode.iterm2.plist ~/Library/Preferences

mkdir ~/bin
echo "Adding local /bin to /etc/paths, may be prompted for root password"
sudo sh -c "echo /Users/dmadouros/bin >> /etc/paths"

echo "****************************"
echo "Setup complete!"
echo "Please restart now"
echo "****************************"
