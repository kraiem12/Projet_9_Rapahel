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
    web.vm.hostname = "web.dev"
    # static ip address
    web.vm.network :private_network, ip: "192.168.60.2"
  end
  # Application server
  config.vm.define "app-server" do |app|
    app.vm.hostname = "app.dev"
  # static ip address
    app.vm.network :private_network, ip: "192.168.60.3" 
  end
  # Database server
  config.vm.define "database" do |db|
    db.vm.hostname = "db.dev"
    # static ip address
    db.vm.network :private_network, ip: "192.168.60.4"
  end
  config.vm.provision "file", source: ".ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  public_key = File.read(".ssh/id_rsa.pub")
  config.vm.provision :shell, :inline =>"
     echo 'Copying public SSH Keys to the VM'
     mkdir -p /home/vagrant/.ssh
     chmod 700 /home/vagrant/.ssh
     echo '#{public_key}' >> /home/vagrant/.ssh/authorized_keys
     chmod -R 600 /home/vagrant/.ssh/authorized_keys
     echo 'Host 192.168.60.*' >> /home/vagrant/.ssh/config
     echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
     echo 'UserKnownHostsFile /dev/null' >> /home/vagrant/.ssh/config
     chmod -R 600 /home/vagrant/.ssh/config
     ", privileged: false
  config.ssh.username = 'vagrant'
end
