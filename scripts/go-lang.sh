#!/bin/bash -eux

# Install Go
sudo apt-get install -y golang

# Create workspace directories
mkdir -p $GOPATH/bin
mkdir -p $GOPATH/pkg
mkdir -p $GOPATH/src
mkdir -p $GOPATH/src/github.com

# Setup Go Path
echo -e "export GOPATH=$HOME/go\nexport PATH=$PATH:$GOPATH/bin" | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile
