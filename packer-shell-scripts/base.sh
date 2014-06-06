#!/bin/bash -eux

cat <<EOF | sudo tee /etc/apt/sources.list
#############################################################
################### OFFICIAL UBUNTU REPOS ###################
#############################################################

###### Ubuntu Main Repos
deb http://us.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse

###### Ubuntu Update Repos
deb http://us.archive.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse

###### Ubuntu Partner Repo
deb http://archive.canonical.com/ubuntu trusty partner
deb-src http://archive.canonical.com/ubuntu trusty partner
EOF
# 
# ami-5a32c332

sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y linux-headers-$(uname -r) dkms nfs-common git-core whois traceroute htop unzip sysstat vim libmysqlclient-dev postgresql-server-dev-9.3               
# sudo apt-mark hold grub grub-common grub-pc grub-pc-bin grub2-common grub-legacy-ec2
# sudo apt-get install -y linux-headers-generic
sudo apt-get -y upgrade


