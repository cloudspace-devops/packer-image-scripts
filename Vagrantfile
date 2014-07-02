$domain_name = "packer.cloudspace.com"
$vagrant_ip = "33.33.162.179"
$box_name = "packer-virtualbox.box"
# $box_path = "http://devops.cloudspace.com/images/"
$box_path = "file:///srv/packer-image-scripts/builds/packer/"
$cpus = 2
$memory = 2048
$buildbox = "../microservice"

Vagrant.configure(2) do |config|
  org = $domain_name
  config.vm.box = $box_name
  config.vm.box_url = File.join($box_path, $box_name)
  config.ssh.private_key_path = ['./sample-client-config/devops/vagrant.pem', File.join(ENV['HOME'], '.ssh', 'id_rsa')]
  config.ssh.forward_agent = true
  config.vm.network "private_network", ip: $vagrant_ip
  config.vm.synced_folder $buildbox, "/srv/#{org}", :nfs => { :mount_options => ["dmode=777","fmode=777"] }

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", $memory, "--name", $domain_name,"--cpus", $cpus]
  end
end
