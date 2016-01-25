# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-nocm"
  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true if Vagrant::VERSION =~ /^1.8/
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, '--paravirtprovider', 'kvm']
    v.customize ["modifyvm", :id, '--ioapic', 'on']
  end
  config.vm.network "private_network", ip: "192.168.20.20"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "./bootstrap.sh"

end
