module Vagrant
  module ReverseSamba
    class Plugin < Vagrant.plugin(2)
      
      name 'vagrant-reverse_samba'
      description 'creates a samba server on the vagrant box and mounts it on the host machine'
      
      provisioner :reverse_samba do
        require_relative 'provisioner'
        Vagrant::ReverseSamba::Provisioner
      end
      
      config :reverse_samba, :provisioner do
        require_relative 'config'
        Vagrant::ReverseSamba::Config
      end
      
    end
  end
end