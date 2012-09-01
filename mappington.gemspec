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

  gem.requirements << '*** This library requires Hashie >= 2.0.0.beta ***'
  gem.requirements << '*** You will have to download it from Github  ***'

  gem.post_install_message =<<-MESSAGE
Thank you for installing Mappington, but I need you to do a little legwork
before you can use this library.

Mappington uses Hashie internally, specifically Hashie version >=2.0.0.beta. Being
Beta, the maintainers of Hashie have not pushed their gem to Rubygems.org. You must
install Hashie from github.com/intridea/hashie.

<3 Ken
MESSAGE

  gem.add_dependency 'hashie' # , '>=2.0.0.beta'
  gem.add_development_dependency 'rspec'
end
