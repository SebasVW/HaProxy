#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install  apache2

rm -rf /var/www
ln -fs /vagrant /var/www


