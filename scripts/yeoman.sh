#!/bin/bash -eux

# npm has issues if you don't reset eth0
sudo ifdown eth0
sudo ifup eth0

# install yeoman, grunt and bower
sudo npm install yo -g --no-insight
