#!/bin/bash -eux

# Install Xcode and Xcode Command Line Tools
xcode-select --install

# Install Brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew tap homebrew/binary
brew update

# Install git
brew install git
echo -n "Enter your full name for git and press [ENTER]: "
read fullname
echo -n "Enter your email address for git and press [ENTER]: "
read emailaddress
git config --global user.name "$fullname"
git config --global user.email "$emailaddress"

# Install Virtualbox
cd ~/Downloads/
curl -L -O http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-OSX.dmg
hdiutil attach VirtualBox-*.dmg
sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /
hdiutil detach /Volumes/VirtualBox

# Install Vagrant
curl -L -O https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3.dmg
hdiutil attach vagrant_*.dmg
sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -target /
hdiutil detach /Volumes/Vagrant

# Install Packer
brew install packer

# Setup local srv folder
if [[ ! -f /srv ]]; then
	sudo mkdir /srv
fi
sudo chown -R `eval whoami` /srv
cd /srv

# Create id_rsa key if needed
if [[ ! -f $HOME/.ssh/id_rsa ]]; then
	ssh-keygen -t rsa -C "$emailaddress"
	chmod 600 $HOME/.ssh/id_rsa
fi
