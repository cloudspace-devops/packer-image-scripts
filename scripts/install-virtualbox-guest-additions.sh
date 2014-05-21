#!/bin/bash

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount -t iso9660 -o loop /home/cloudspace/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
/tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
umount isomount
rm -rf isomount /home/cloudspace/VBoxGuestAdditions.iso

# from: https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh

