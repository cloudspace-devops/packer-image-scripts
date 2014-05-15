packer
======

set environment variables

I think I can remove these since I added them to the box in provisioning
brew install ec2-ami-tools
brew install ec2-api-tools

packer build -var 'aws_access_key=YOUR ACCESS KEY' -var 'aws_secret_key=YOUR SECRET KEY' ubuntu14_04-ruby2_1_2-rails4_1_1.json
