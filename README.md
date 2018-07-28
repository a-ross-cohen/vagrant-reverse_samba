## 'reverse' samba share setup for vagrant

## requirements
You must have samba client installed on your host machine. Currently this plugin only supports OS X as a host and ubuntu as a guest OS.

## installation
See the [vagrant plugin installation instructions](https://www.vagrantup.com/docs/cli/plugin.html#plugin-install)

## usage

```
# you can set up any network interface you want, as long as the host can reach the guest through it
override.vm.network :private_network, ip: '192.168.99.99'

override.vm.provision :reverse_samba, ip: '192.168.99.99', guest_mount: '/root-share-path', host_mount: File.expand_path('~/local-mount-path')
```
parameters are as follows:
  - ip: the ip that the guest OS can be accessed on
  - guest_mount: the path on the guest OS machine that is to be the root of the samba share
  - host_mount: the path on your local host machine you want the share to be mounted to (must be a full path)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a-ross-cohen/vagrant-reverse_samba.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
