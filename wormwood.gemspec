# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wormwood/version'

Gem::Specification.new do |gem|
  gem.name          = "wormwood"
  gem.version       = Wormwood::VERSION
  gem.authors       = ["Erik Eldridge"]
  gem.email         = "contact@erikeldridge.com"
  gem.description   = "Wormwood is an event-driven file rendering utility inspired by Jekyll."
  gem.summary       = "Wormwood watches for changes to a template directory (\"./\" by default), "+
                      "renders the changed files (via Tilt), and writes the rendered output to "+
                      "an output directory (\"./\" by default)."
  gem.homepage      = "http://github.com/erikeldridge/wormwood"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('commander', "~> 4.1.3")
  gem.add_runtime_dependency('directory_watcher', "~> 1.1")
  gem.add_runtime_dependency('tilt', "~> 1.3.3")
end
