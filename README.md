# Cloudspace DevOps -- Packer

The repo contains Clousdpace's scripts & configs to build client VMs (vagrant, AMIs, VMWare, etc.) with Packer.io.  It also conains initial Capistrano deploy setups, a dev environment Vagrantfile, and scrips to configure a new OS X dev machine and setup individual projects.


## Configuring a new computer.
bash <(curl -s https://raw.githubusercontent.com/cloudspace-devops/packer-image-scripts/master/sample-client-config/devops/dev-machine-setup.sh)