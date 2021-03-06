# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polyssh/version'

Gem::Specification.new do |spec|
  spec.name          = 'polyssh'
  spec.version       = PolySSH::VERSION
  spec.authors       = ["Glenn Y. Rolland"]
  spec.email         = ['glenux@glenux.net']

  spec.summary       = %q{Multi-hop SSH tunneling tool.}
  spec.description   = %q{Multi-hop SSH tunneling tool.}
  spec.homepage      = 'https://github.com/glenux/polyssh'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "net-scp"
  spec.add_runtime_dependency "net-ssh"
  spec.add_runtime_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
