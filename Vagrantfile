Vagrant.configure("2") do |config|
  config.vm.define "k8s01" do |subconfig|
    subconfig.vm.box = "ubuntu/xenial64"
    subconfig.vm.hostname = "k8s01"
    subconfig.vm.network :private_network, ip: "192.168.31.70"
  end

  config.vm.define "k8s02" do |subconfig|
    subconfig.vm.box = "ubuntu/xenial64"
    subconfig.vm.hostname = "k8s02"
    subconfig.vm.network :private_network, ip: "192.168.31.232"
  end

  config.vm.define "k8s03" do |subconfig|
    subconfig.vm.box = "ubuntu/xenial64"
    subconfig.vm.hostname = "k8s03"
    subconfig.vm.network :private_network, ip: "192.168.31.231"
  end
  
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y avahi-daemon libnss-mdns
  SHELL
end