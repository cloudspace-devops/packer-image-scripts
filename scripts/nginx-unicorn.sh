#!/bin/bash -eux

# Install nginx
sudo apt-get install nginx -y
sudo useradd -s /sbin/nologin -r nginx

sudo groupadd web
sudo usermod -a -G web nginx
sudo usermod -a -G web vagrant
# Copy over unicorn nginx conf file
# sudo mkdir -p /srv/www
# sudo chgrp web /srv/www


#Install Unicorn
#rbenv rehash
#gem install unicorn
