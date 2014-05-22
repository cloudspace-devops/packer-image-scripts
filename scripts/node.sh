#!/bin/bash

# node
cd /usr/local/src/
sudo wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz
sudo tar -xzf node-v0.10.28-linux-x64.tar.gz

# this gets the source for npm on some packages
sudo wget http://nodejs.org/dist/v0.10.28/node-v0.10.28.tar.gz
sudo tar -xzf node-v0.10.28.tar.gz

# link node and npm to /usr/bin
sudo ln -s /usr/local/src/node-v0.10.28-linux-x64/bin/node /usr/bin/
sudo ln -s /usr/local/src/node-v0.10.28-linux-x64/bin/npm /usr/bin/

# install yeoman, grunt and bower
# sudo npm cache clean
# sudo npm install -g yo
