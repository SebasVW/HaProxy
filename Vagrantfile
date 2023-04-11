# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "web1" do |w|
      #w.vm.network :private_network, ip: "192.168.33.11"
      w.vm.box = "bento/ubuntu-16.04"
      w.vm.provision "shell" , path: "apache.sh"
      w.vm.network "forwarded_port", guest:80, host: 8080
#      w.vm.synced_folder "LOCAL", "VIRTUAL"
#      w.vm.synced_folder "www/", "/var/www/html"
       w.vm.provision "file", source: "www/index.html",
       destination: "/var/www/html/index.html"
  end

  config.vm.define "web2" do |ww|
      #ww.vm.network :private_network, ip: "192.168.33.12"
      ww.vm.box = "bento/ubuntu-16.04"
      ww.vm.network "forwarded_port", guest:80, host: 8088
       ww.vm.provision "shell", inline: <<-SHELL
         sudo apt-get update
         sudo apt-get install -y nginx
         echo "Hello world..." > /var/www/html/index.html
       SHELL
  end

  config.vm.define "hap" do |hap|
      #hap.vm.network :private_network, ip: "192.168.33.11"
      hap.vm.box = "bento/ubuntu-16.04"
      hap.vm.provision "shell" , path: "hap.sh"
  end
end

