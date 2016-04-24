# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "vantriet/jessie-base"

  config.vm.hostname = "data-science"

  config.ssh.private_key_path="private_key"

  config.vm.synced_folder File.join("..", "vm_share"), "/media/vm_share",
        create: true, owner: "mendel", group: "mendel"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

#  second_disk_uuid = ""

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.name = "jessie-data-science"
  
    vb.customize ["modifyvm", :id, "--memory", "8192"]
    vb.customize ["modifyvm", :id, "--cpus", "8"]
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
    vb.customize ["modifyvm", :id, "--vram", "64"]
    vb.customize ["modifyvm", :id, '--audio', 'alsa', '--audiocontroller', 'hda'] # choices: hda sb16 ac97
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "emptydrive"]
    
    line = `VBoxManage list systemproperties | grep "Default machine folder"`
    vb_machine_folder = line.split(':').drop(1).join(':').strip()
    second_disk_file = File.join(vb_machine_folder, vb.name, 'disk2.vdi')
    
    unless File.exist?(second_disk_file)
      vb.customize ["createhd", "--filename", second_disk_file, "--format", "VDI", "--size", 500 * 1024]
    end
    vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', second_disk_file]

#    line = %x( VBoxManage showhdinfo #{second_disk_file} | grep ^UUID )
#    second_disk_uuid = line.split(':')[1].strip()

  end
  
  config.vm.provision :shell, path: "bootstrap.sh"
  
#  config.vm.provision :shell, path: "bootstrap-hdd.sh -u #{second_disk_uuid}"

end
