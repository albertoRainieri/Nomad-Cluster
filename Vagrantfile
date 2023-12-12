ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "nomad_bootstrap.sh"

  # Kubernetes Master Server
  config.vm.define "nmaster" do |node|
  
    node.vm.box = "sloopstash/ubuntu-22-04"
    node.vm.box_version = "2.1.1"
    node.vm.box_check_update  = false
    node.vm.hostname          = "nmaster.example.com"

    node.vm.network "private_network", ip: "192.168.201.100"
  
    node.vm.provider "vmware_fusion" do |v|
      v.gui    = false
      v.memory  = 2048
      v.cpus    =  2
    end
  
    # node.vm.provider :libvirt do |v|
    #   v.memory  = 2048
    #   v.nested  = true
    #   v.cpus    = 2
    # end
  
    node.vm.provision "shell", path: "nomad_master_config.sh"

  end


  # Kubernetes Worker Nodes
  NodeCount = 2

  (1..NodeCount).each do |i|

    config.vm.define "nclient#{i}" do |node|

      node.vm.box = "sloopstash/ubuntu-22-04"
      node.vm.box_version = "2.1.1"
      node.vm.box_check_update  = false
      node.vm.hostname          = "nclient#{i}.example.com"

      node.vm.network "private_network", ip: "192.168.201.10#{i}"

      node.vm.provider "vmware_fusion" do |v|
        v.gui    = false
        v.memory  = 2048
        v.cpus    = 2
      end

      # node.vm.provider :libvirt do |v|
      #   v.memory  = 2048
      #   v.nested  = true
      #   v.cpus    = 2
      # end

      node.vm.provision "shell", path: "nomad_client_config.sh"

    end

  end

end