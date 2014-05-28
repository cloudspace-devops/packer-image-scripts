#!/bin/bash -eux

# Remove all old builds
rm -Rf `ls -1 -d builds/*`

# Build in order
packer build ubuntu.json
packer build ubuntu-node.json
packer build ubuntu-ruby.json
packer build ubuntu-ruby-mysql.json
packer build ubuntu-ruby-postgresql.json
packer build ubuntu-mysql.json
packer build ubuntu-postgresql.json