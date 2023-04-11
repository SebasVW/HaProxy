#!/usr/bin/env bash

sudo apt-get update 
sudo apt install -y haproxy
sudo sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy
sudo mv /etc/haproxy/haproxy.cfg{,.original}
sudo cp -f /vagrant/haproxy.cfg /etc/haproxy/
service haproxy restart
