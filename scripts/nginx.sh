#!/bin/bash -eux

# Install nginx
sudo apt-get install nginx -y
sudo useradd -s /sbin/nologin -r nginx

sudo groupadd web
sudo usermod -a -G web nginx
sudo usermod -a -G web vagrant

#Install Unicorn
gem install unicorn
mkdir -p /etc/unicorn
mkdir -p /var/log/unicorn
cat <<'EOF' > /etc/unicorn/app.rb
rails_env = ENV['RAILS_ENV'] || 'production'
worker_processes 1
preload_app true
timeout 30
listen '/srv/www/app/unicorn.sock', :backlog => 2048
pid '/var/run/app_unicorn.pid'

# Setup logging paths
stderr_path '/var/log/unicorn/app_error.log'
stdout_path '/var/log/unicorn/app_access.log'

working_directory '/srv/www/app/current'

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "/srv/www/app/current/Gemfile"
end

before_fork do |server, worker|
  old_pid = '/var/run/app_unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
EOF
