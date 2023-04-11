#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install nginx

rm -rf /var/www
ln -fs /vagrant /var/www

