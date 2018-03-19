module Vagrant
  module ReverseSamba
    class Provisioner < Vagrant.plugin(2, :provisioner)
      
      def provision
        puts 'reverse samba --> provision'
        machine.communicate.execute 'sudo apt-get install -y samba'
        machine.communicate.execute "
          sudo tee /etc/samba/smb.conf <<- EOF
          [global]
             workgroup = workgroup
             server string = vagrant
             log file = /var/log/samba/log.%m
             max log size = 1000
             syslog = 0
             panic action = /usr/share/samba/panic-action.%d
             server role = standalone

          [vagrant]
             comment = home Directory of user vagrant
             path = #{config.guest_mount}
             browseable = yes
             read only = no
             guest ok = no
             valid users = vagrant
             preserve case = yes
             short preserve case = yes
             default case = lower
             case sensitive = yes
EOF"
        machine.communicate.execute 'sudo testparm'
        machine.communicate.execute 'sudo service samba reload'
        machine.communicate.execute "sudo bash -c 'echo -ne \"vagrant\nvagrant\n\" | smbpasswd -a -s vagrant'"
        puts `mkdir -p #{config.host_mount}`
        puts `mount_smbfs //vagrant:vagrant@#{config.ip}/vagrant #{config.host_mount}`
        puts "reverse samba <--"
      end
      
      def cleanup
        puts 'reverse samba --> cleanup'
        puts `umount #{config.host_mount}`
        puts `rm -r #{config.host_mount}`
        puts 'reverse samba <--'
      end
      
    end
  end
end