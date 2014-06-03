# capistrano
cap install

# Capfile
sed -i "1s/^/Dotenv.load\n/" Capfile
sed -i "1s/^/require 'dotenv'\n/" Capfile
sed -i "s/# require 'capistrano\/bundler'/require 'capistrano\/bundler'/g" Capfile
sed -i "s/# require 'capistrano\/rails\/assets'/require 'capistrano\/rails\/assets'/g" Capfile
sed -i "s/# require 'capistrano\/rails\/migrations'/require 'capistrano\/rails\/migrations'/g" Capfile
sed -i "s/tasks\/\*\.cap')\.each/tasks\/\*\.rake')\.each/g" Capfile

# config/deploy.rb
sed -i "s/set :application, 'my_app_name'//g" config/deploy.rb
sed -i "s/lock '3.1.0'/#lock '3.1.0'/g" config/deploy.rb
sed -i "s/set :repo_url, 'git@example.com:me\/my_repo.git'/set :repo_url, #{ENV['REPOSITORY_URL']}/g" config/deploy.rb
sed -i "s/# set :scm, :git/set :scm, :git/g" config/deploy.rb
sed -i "s/# set :format, :pretty/set :format, :pretty/g" config/deploy.rb
sed -i "s/# set :log_level, :debug/set :log_level, :debug/g" config/deploy.rb
sed -i "s/# set :linked_files, %w{config\/database.yml}/set :linked_files, %w{.env}/g" config/deploy.rb
sed -i "s/# set :linked_dirs, %w{bin log tmp\/pids tmp\/cache tmp\/sockets vendor\/bundle public\/system}/set :linked_dirs, %w{log}/g" config/deploy.rb
sed -i "s/# set :keep_releases, 5/set :keep_releases, 5/g" config/deploy.rb
sed -i "s/after :restart, :clear_cache do/# after :restart, :clear_cache do/g" config/deploy.rb
sed -i "s/on roles\(:web\), in: :groups, limit: 3, wait: 10 do/# on roles\(:web\), in: :groups, limit: 3, wait: 10 do/g" config/deploy.rb
sed -i '55s/end/# end/' config/deploy.rb
sed -i '56s/end/# end/' config/deploy.rb
sed -i '3i set :stages, %w(staging production)' config/deploy.rb
sed -i "4i set :default_stage, 'staging'" config/deploy.rb
sed -i "5i set :ssh_options, keys: ['~/.ssh/id_rsa'], forward_agent: true, user: 'app'" config/deploy.rb
