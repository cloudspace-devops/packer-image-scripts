# Cloudspace DevOps -- Packer

The repo contains Clousdpace's scripts & configs to build client VMs (vagrant, AMIs, VMWare, etc.) with Packer.io.  It also conains initial Capistrano deploy setups, a dev environment Vagrantfile, and scrips to configure a new OS X dev machine and setup individual projects.


## Configuring a new computer

1. Run the following script in terminal on your computer: 
`bash <(curl -s https://raw.githubusercontent.com/cloudspace-devops/packer-image-scripts/master/osx-dev-machine-setup.sh)`
2. When prompted, select "Install" to get the command line developer tools.  After the install completes, dismiss the dialogue and press [return] in terminal.
3. Enter your system password when prompted to install Brew
4. Enter your full name and password for git when prompted.
5. If prompted, enter your system password to create a /srv folder for development.
6. If prompted, press enter to use the defaults three times to generate your id_rsa key.


## Building Packer Images

1. Run `./build-all.sh` to create all base images
2. To run an individual script, run: `packer build build-name.json`
3. To create a custom project box, copy the closest match into the packer-projects folder, update the base image source, add/create the appropriate shell script(s), and run the build.
