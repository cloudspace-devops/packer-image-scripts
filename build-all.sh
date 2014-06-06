#!/bin/bash -eux

# Remove all old builds
# rm -Rf `ls -1 -d builds/*`

# Build in order
cd packer-base
packer build ubuntu.json
packer build ubuntu-node.json
packer build ubuntu-ruby.json
packer build ubuntu-ruby-mysql.json
packer build ubuntu-ruby-postgresql.json
packer build ubuntu-mysql.json
packer build ubuntu-postgresql.json
cd ../

# cd packer-projects
cd packer-projects
packer build cleverdb.json
packer build packer.json
packer build pillphone.json
cd ../