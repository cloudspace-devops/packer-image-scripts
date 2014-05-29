#!/bin/bash -eux

# Install ruby and rails
sudo apt-get install -y git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

# Set default Git user
git config --global user.name "Cloudspace"
git config --global user.email "info@cloudspace.com"

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

echo $PATH

# Add rbenv paths and eval to .bashrc and .bash_profile (needed in login/non-login shells)
echo -e 'export PATH="./bin:$HOME/.rbenv/bin:$PATH"\neval "$(rbenv init -)"' | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile

echo $PATH

# Install ruby-build, gem rehash, rbenv update rbenv plugns
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone git://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update

# Install and set default ruby version
cd ~/.rbenv
#rbenv install --keep 1.9.3-p547
#rbenv install --keep 2.0.0-p481
#rbenv install --keep 2.1.0
#rbenv install --keep 2.1.1
rbenv install --keep 2.1.2
rbenv global 2.1.2
ruby -v
echo -e "install: --no-ri --no-rdoc\nupdate: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler
gem install bundler

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
