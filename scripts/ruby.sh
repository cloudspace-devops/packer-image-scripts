#!/bin/bash -eux

# Install ruby and rails
sudo apt-get install -y git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

# Set default Git user
git config --global user.name "Cloudspace"
git config --global user.email "info@cloudspace.com"

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# Install ruby-build
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Add rbenv and ruby-build paths and eval to .bashrc
echo 'export RBENV_ROOT="$HOME/.rbenv"'
echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

# Install and set default ruby version
#rbenv install 1.9.3-p547
#rbenv install 2.0.0-p481
#rbenv install 2.1.0
#rbenv install 2.1.1
rbenv install --keep 2.1.2
rbenv global 2.1.2
ruby -v
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install rbenv-bundler to make rbenv shims "bundler aware"
git clone git://github.com/carsomyr/rbenv-bundler.git ~/.rbenv/plugins/bundler

# Install bundler
gem install bundler
mkdir -p ~/.bundle
echo -e "---\nBUNDLE_PATH: ~/vendor/bundle\nBUNDLE_DISABLE_SHARED_GEMS: \"1\"" >> ~/.bundle/config
rbenv rehash

# Install common gems
gem install rails
gem install mysql2
gem install pg
gem install nokogiri
gem install sass-rails
gem install uglifier
gem install coffee-rails
gem install execjs
gem install jquery-rails
gem install turbolinks
gem install jbuilder
gem install sdoc
gem install bcrypt
gem install unicorn
gem install capistrano-rails
gem install thread_safe
gem install aws-sdk
gem install therubyracer
gem install devise
gem install cancan
gem install rolify
gem install haml
gem install slim
gem install paperclip
gem install sshkey
gem install twitter-bootstrap-rails
gem install less-rails
gem install omniauth-github
gem install binding_of_caller
gem install net-ssh
gem install rspec
gem install rspec-rails
gem install shoulda
gem install database_cleaner
gem install factory_girl_rails
gem install faker
gem install yard
gem install yard-activerecord
gem install redcarpet
gem install github-markup
gem install pry-byebug
gem install pry-rails
gem install rails_best_practices
gem install rubocop
gem install ruby-progressbar
gem install metric_fu
gem install guard-bundler
gem install guard-rails
gem install guard-rspec
gem install librarian-chef
