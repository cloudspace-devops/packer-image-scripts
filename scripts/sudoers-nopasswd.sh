#!/bin/bash -eux

echo 'cloudspace'|sudo -S sed -i 's/^%sudo\s\+ALL=(ALL:ALL)\s\+ALL/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
