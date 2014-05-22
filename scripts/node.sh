#!/bin/bash -eux

# node
cd /usr/local/src/
wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz
tar -xzvf node-v0.10.28-linux-x64.tar.gz

# this gets the source for npm on some packages
wget http://nodejs.org/dist/v0.10.28/node-v0.10.28.tar.gz
tar -xzvf node-v0.10.28.tar.gz

# adds node / npm to the path
sudo echo "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/src/node-v0.10.28-linux-x64/bin\"" > /etc/environment

