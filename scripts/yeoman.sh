# install yeoman, grunt and bower
sudo npm cache clean
sudo npm config set registry http://registry.npmjs.org/
sudo npm install -g  npm-install-retry
sudo npm-install-retry --wait 500 --attempts 10 -- "bower"
sudo npm-install-retry --wait 500 --attempts 10 -- "grunt-cli"
sudo npm-install-retry --wait 500 --attempts 10 -- "yeoman-generator"
sudo npm-install-retry --wait 500 --attempts 10 -- "yo -g --no-insight"
