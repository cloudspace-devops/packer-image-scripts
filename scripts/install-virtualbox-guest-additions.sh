#!/bin/bash

# Mount the disk image
cd /tmp
sudo mkdir /tmp/isomount
sudo mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions_{{.Version}}.iso /tmp/isomount

# Install the drivers
sudo /tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
sudo umount isomount
sudo rm -rf isomount /home/vagrant/VBoxGuestAdditions.iso

# from: https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh

