# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_chess/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_chess"
  spec.version       = RubyChess::VERSION
  spec.authors       = ["Jorge L Pérez"]
  spec.email         = ["jolisper@gmail.com"]
  spec.description   = %q{Chess}
  spec.summary       = %q{Classic chess}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
