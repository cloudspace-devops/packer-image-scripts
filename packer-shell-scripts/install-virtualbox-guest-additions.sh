#!/bin/bash -eux

# Install Module Assistant
sudo apt-get install -y module-assistant

# Install guest additions
sudo apt-get install -y virtualbox-guest-utils


# sudo m-a prepare

# # Mount the disk image
# sudo mkdir /tmp/isomount
# sudo mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions_*.iso /tmp/isomount

# # Install the drivers
# cd /tmp/isomount
# sudo sh VBoxLinuxAdditions.run --nox11

# # Cleanup
# cd /
# sudo umount /tmp/isomount
# # sudo rm -rf /tmp/isomount /home/vagrant/VBoxGuestAdditions_*.iso

# # from: https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh

# sudo ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions

# sudo reboot
# sleep 60

# sudo /etc/init.d/vboxadd setup
# sudo update-rc.d vboxadd defaults
# sudo update-rc.d vboxadd enable

# NOTES FOR MANUAL INSTALL

# mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` vagrant /vagrant
# mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant` vagrant /vagrant

# sudo mount -t vboxsf -o uid=1000,gid=1000 UserData /media/UserData

# On OSX
# gem install nokogiri -v '1.6.2.1'

# dmesg | grep vbox

