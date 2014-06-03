BOXPATH="./devops/builds"
BOXNAME="sitename-web.box"
BASEOVF="ruby-mysql-latest"

# TODO: check for newer versions
wget -P devops/tmp http://devops.cloudspace.com/images/$BASEOVF.ovf
wget -P devops/tmp http://devops.cloudspace.com/images/$BASEOVF-disk1.vmdk

packer build client.json

# Run vagrant up using the Vagrantfile
cd ../
vagrant up

# Run bundle and db:setup
vagrant ssh -c "cd /srv/#{org} && bundle && bundle exec rake db:setup"

# Return to devops directory
cd devops