#!/bin/bash -eux

# Install Xcode and Xcode Command Line Tools
xcode-select --install

# Install Brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew tap homebrew/binary
brew update

# Install wget
brew install -y wget

# Install Virtualbox
cd /tmp
wget http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-OSX.dmg
hdiutil attach VirtualBox-*.dmg
sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /Volumes/Macintosh\ HD
hdiutil detach /Volumes/VirtualBox

# Install Vagrant
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.2.dmg
hdiutil attach vagrant_*.dmg
sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -target /Volumes/Macintosh\ HD
hdiutil detach /Volumes/Vagrant

# Install Packer
brew install packer