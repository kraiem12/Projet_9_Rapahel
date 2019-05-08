# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 # General Vagrant VM configuration.
 # All VMs will run under centos7 exploitation system
 config.vm.box = "geerlingguy/centos7"
 # If true, Vagrant will automatically insert a keypair
 # to use for SSH, replacing Vagrant's default insecure key
 # inside the machine if detected. By default, this is true
 config.ssh.insert_key = false
 # Configures synced folders on the machine, so that folders
 # on your host machine can be synced to and from the guest machine
 config.vm.synced_folder ".", "/vagrant", disabled: true
 # VM Provider
 config.vm.provider :virtualbox do |v|
  v.memory = 256
  v.linked_clone = true
 end
 # Web server
 config.vm.define "web-server" do |web|
  web.vm.hostname = "devops-web.dev"
  # static ip address
  web.vm.network :private_network, ip: "192.168.60.4"
  web.vm.provision "ansible" do |ansible|
  ansible.playbook = "installapache.yml"
  end
end
 # Application server
  config.vm.define "app-server" do |app|
  app.vm.hostname = "devops-app.dev"
  # static ip address
  app.vm.network :private_network, ip: "192.168.60.5"
  app.vm.provision "ansible" do |ansible|
  ansible.playbook = "tomcat.yml"
 end
end
 # Database server
  config.vm.define "database" do |db|
  db.vm.hostname = "devops-db.dev"
  # static ip address
  db.vm.network :private_network, ip: "192.168.60.6"
  db.vm.provision "ansible" do |ansible|
  ansible.playbook = "installmariadb.yml"
end
 end
end