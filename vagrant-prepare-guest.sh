#!/bin/bash
#
# vagrant-prepare-guest.sh
#
# Runs on the vagrant box after ansible provisioning.
# This script is run automatically on `vagrant up`.  You do not need to this manually.
#

# We must add www-data to the aegir group in vagrant because the synced folder
# /var/aegir/devshop-6.x-1.x (devshop front-end) is owned by aegir.
sudo adduser www-data aegir
if [ -f '/etc/init.d/apache2' ]; then
  sudo service apache2 restart
elif [ -f '/etc/init.d/nginx' ]; then
  sudo service nginx restart
fi

sudo ln -s /vagrant /usr/share/devshop

# Setup docker
sudo su -c "wget -qO- https://get.docker.com/ | sh"

# Add aegir to docker group
 sudo usermod -aG docker aegir
 
# Launch Rancher server
docker run -d --restart=always -p 8080:8080 rancher/server

# Pull rancher agent container so it's ready to launch
docker pull rancher/agent:v0.7.9

