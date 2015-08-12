#!/usr/bin/env bash

# Install composer and phpunit
cd /home/vagrant
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
mkdir /home/vagrant/.composer
sudo mkdir /root/.composer
cp /vagrant/auth.json /home/vagrant/.composer/auth.json
sudo cp /vagrant/auth.json /root/.composer/auth.json
# composer global require "phpunit/phpunit"
git clone https://github.com/facebook/php-webdriver.git
composer global require "facebook/webdriver=~1.0"
cd /home/vagrant/php-webdriver
sudo composer install
sudo ln -s /home/vagrant/php-webdriver/vendor/bin/phpunit /usr/local/bin/phpunit

# Install jenkins
/usr/bin/wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
sudo service jenkins restart

