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

1. Set your AWS key/secret as an environment variable

    ``` 
    export AWS_ACCESS_KEY_ID="xxxxxxxxx"
    export AWS_SECRET_ACCESS_KEY="xxxxxxx
    ```

2. Create all base images

    ``` 
    ./build-all.sh
    ``` 

3. Run the desired individual build script

    ``` 
    packer build build-name.json
    ```

4. To create a custom project box, copy the closest match into the packer-projects folder, update the base image source, add/create the appropriate shell script(s), and run the build.

# Launching AWS Boxes

1. Login to the EC2 console with your Amazon IAM account: https://console.aws.amazon.com/console/home?region=us-east-1 (If you don't have an Amazon IAM user setup, request one from DevOps.)
2. Click "EC2"
3. Click "Launch Instance"
4. community amis
search for ami-c8cf3ba0 
select instance size
click Next: Configure Instance Details
(advanced details if you want to add cloud-init)
click Next: Add Storage
(configgle your storage)
click Next: Tag Instance
(name your instance
click Next: Configure Security Group)
select existing or create a new security group
click Review and Launch
scroll down and click Launch
Choose an existing keypair or make a new one.
click Launch Instances
scroll down and click View Instances

# grab the public ip of your launched container and toss that in the .env file under whatever environment you want


,{ 
    "type": "virtualbox-ovf",
    "vm_name": "{{user `vm_name`}}",
    "source_path": "../builds/{{user `base_box`}}",
    "output_directory": "../builds/{{user `directory_name`}}",
    "ssh_username": "vagrant",
    "ssh_password": "vagrant",
    "ssh_wait_timeout": "20m",
    "shutdown_command": "sudo shutdown -P now"
  }



  ,
      "../packer-shell-scripts/ec2-api-tools.sh"



      


            "../packer-shell-scripts/sudoers-nopasswd.sh",
      "../packer-shell-scripts/base.sh",




  postfix.sh fixed
  yeoman.sh fixed



