#!/bin/bash -eux

sudo apt-get update
sudo apt-get -y upgrade

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y install linux-headers-$(uname -r) build-essential dkms nfs-common

sudo apt-get clean