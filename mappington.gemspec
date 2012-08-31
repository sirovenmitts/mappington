# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mappington/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Kenneth Pullen']
  gem.email         = ['kenneth.pullen@gmail.com']
  gem.description   = %q{Maps from Google, stat!}
  gem.summary       = %q{Maps from Google, stat!}
  gem.homepage      = 'https://github.com/kpullen/mappington'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'mappington'
  gem.require_paths = ['lib']
  gem.version       = Mappington::VERSION

  gem.add_dependency 'hashie', '>=2.0.0.beta'
  gem.add_dependency 'addressable'
  gem.add_development_dependency 'rspec'
end
