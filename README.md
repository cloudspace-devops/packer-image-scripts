packer
======

set environment variables

I think I can remove these since I added them to the box in provisioning
brew install ec2-ami-tools
brew install ec2-api-tools

packer build -var 'aws_access_key=YOUR ACCESS KEY' -var 'aws_secret_key=YOUR SECRET KEY' ubuntu14_04-ruby2_1_2-rails4_1_1.json


asembla - commons
opssource - vmware on demand  (x dollars for x servers)


IaaS/PaaS/OpenStack/CloudFoundry/Piston/P4D footprint w/ multitenent P4D router

1000 users between sept and dec (5 projects each)


        "ansible-galaxy install abtris.nginx-passenger",

,
    {
    "type": "ansible-local",
    "playbook_file": "local.yml"
  }