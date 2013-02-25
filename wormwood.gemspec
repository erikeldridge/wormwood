# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wormwood/version'

Gem::Specification.new do |gem|
  gem.name          = "wormwood"
  gem.version       = Wormwood::VERSION
  gem.authors       = ["Erik Eldridge"]
  gem.email         = "contact@erikeldridge.com"
  gem.description   = %q{A static file renderer inspired by jekyll.}
  gem.summary       = %q{Watches for file changes and renders the changed files.}
  gem.homepage      = "http://github.com/erikeldridge/wormwood"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = "wormwood"
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('commander', "~> 4.1.3")
  gem.add_runtime_dependency('directory_watcher', "~> 1.1")
  gem.add_runtime_dependency('tilt', "~> 1.3.3")
end
