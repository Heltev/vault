# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.     server.vm.box = 'centos/7' echo "export PATH='$PATH:usr/local/bin/'" >> ~/.bash_profile
    #  source ~/.bash_profile
Vagrant.configure('2') do |config|
  config.vm.define "server" do |server|
    server.vm.box = 'centos/7'
    server.vm.hostname = 'server.example.com'
    server.vm.network "private_network", type: "dhcp"
    server.persistent_storage.enabled = true
    server.persistent_storage.size = 5000
    server.persistent_storage.location = "/c/Users/vfredriksen/Documents/Vault/vm/large_disk.vdi"
    server.vm.synced_folder 'course-labs', '/srv/lab'
    server.vm.provision 'shell', inline: <<-SHELL
      rpm -q puppet-release || yum -y install http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm
      rpm -q puppet-agent   || yum -y install puppet-agent
      yum -y install unzip git
      cp /vagrant/course-labs/vault /usr/local/bin/
    SHELL
    server.vm.provision 'puppet' do |puppet|
      puppet.module_path = "modules"
    end
  end

  config.vm.define "client" do |client|
    client.vm.box = 'centos/7'
    client.vm.hostname = 'client.example.com'
    client.vm.network "private_network", type: "dhcp"
    client.persistent_storage.enabled = true
    client.persistent_storage.size = 1000
    client.persistent_storage.location = "/c/Users/vfredriksen/Documents/Vault/vm/small_disk.vdi"
    client.vm.synced_folder 'course-labs', '/srv/lab'
    client.vm.provision 'shell', inline: <<-SHELL
      rpm -q puppet-release || yum -y install http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm
      rpm -q puppet-agent   || yum -y install puppet-agent
      yum -y install unzip
    SHELL
  end
end
