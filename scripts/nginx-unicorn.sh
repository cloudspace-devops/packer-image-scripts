# Install nginx
sudo apt-get install nginx -y
sudo useradd -s /sbin/nologin -r nginx
sudo usermod -a -G web nginx
sudo usermod -a -G web cloudspace
# Copy over unicorn nginx conf file
sudo mkdir /srv
sudo mkdir /srv/www


#Install Unicorn
gem install unicorn
