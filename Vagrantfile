#e -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
VAGRANTFILE_LOCAL = 'Vagrantfile.local'

sdist=ENV['CIF_ANSIBLE_SDIST']
es=ENV['CIF_ANSIBLE_ES']
es_nodes=ENV['CIF_ANSIBLE_ES_NODES']
hunter_threads=ENV['CIF_HUNTER_THREADS']
geo_fqdn=ENV['CIF_GATHERER_GEO_FQDN']

$script = <<SCRIPT
export CIF_ANSIBLE_SDIST=#{sdist}
export CIF_ANSIBLE_ES=#{es}
export CIF_ANSIBLE_ES_NODES=#{es_nodes}
export CIF_HUNTER_THREADS=#{hunter_threads}
export CIF_GATHERER_GEO_FQDN=#{geo_fqdn}
export CIF_BOOTSTRAP_TEST=1

cd /vagrant
bash easybutton.sh
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provision "shell", inline: $script
  config.vm.box = 'ubuntu/xenial64'

  config.vm.network :forwarded_port, guest: 443, host: 8443
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 9200, host: 9200
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus", "2", "--ioapic", "on", "--memory", "2048" ]
    if #{es} == '1'
        vb.customize ["modifyvm", :id, "--cpus", "2", "--ioapic", "on", "--memory", "4096" ]
    end
  end

  if File.file?(VAGRANTFILE_LOCAL)
    external = File.read VAGRANTFILE_LOCAL
    eval external
  end
end
