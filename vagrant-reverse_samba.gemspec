
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant/reverse_samba/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-reverse_samba"
  spec.version       = Vagrant::ReverseSamba::VERSION
  spec.authors       = ["A. Ross Cohen"]
  spec.email         = ["a.ross.cohen@gmail.com"]

  spec.summary       = %q{Reverse samba share plugin for Vagrant}
  spec.description   = %q{Sets up a 'reverse samba share' with a local vagrant instance. This allows the Vagrant instance to be the owner of the storage while still providing access to the file system from the host machine. When using very large filesystems and running large make builds the standard shared storage quickly becomes a bottleneck.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
