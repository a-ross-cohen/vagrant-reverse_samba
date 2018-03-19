module Vagrant
  module ReverseSamba
    class Config < Vagrant.plugin(2, :config)
      
      attr_accessor :ip
      
      attr_accessor :guest_mount
      
      attr_accessor :host_mount
      
    end
  end
end