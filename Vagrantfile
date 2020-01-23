IMAGE_NAME = "bento/ubuntu-16.04"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.define "node-master" do |master|
        master.vm.box = IMAGE_NAME
        config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "8096"]
          vb.customize ["modifyvm", :id, "--cpus", "4"]
        end
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "node-master"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "infra/master-playbook.yml"
        end
    end

    (1..N).each do |i|
        config.vm.define "node-worker#{i}" do |node|
            node.vm.box = IMAGE_NAME
            config.vm.provider :virtualbox do |vb|
              vb.customize ["modifyvm", :id, "--memory", "1024"]
              vb.customize ["modifyvm", :id, "--cpus", "2"]
            end
            node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            node.vm.hostname = "node-worker#{i}"
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "infra/node-playbook.yml"
            end
        end
    end
end
