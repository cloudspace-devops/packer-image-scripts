#!/bin/bash

# Mount the disk image
sudo mkdir /tmp/isomount
sudo mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions_*.iso /tmp/isomount

# Install the drivers
sudo /tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
sudo umount /tmp/isomount
sudo rm -rf /tmp/isomount /home/vagrant/VBoxGuestAdditions_*.iso

# from: https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh

sudo ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions