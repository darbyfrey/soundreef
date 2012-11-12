# -*- encoding: utf-8 -*-
require File.expand_path('../lib/soundreef/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Darby Frey"]
  gem.email         = ["darbyfrey@gmail.com"]
  gem.description   = %q{A simple ruby interface to the Soundreef API}
  gem.summary       = %q{This library provides a simple interface around the Songs, Batches and Earnings endpoints in the Soundreef API}
  gem.homepage      = "https://github.com/darbyfrey/soundreef"

  gem.files         = Dir['lib/**/*.rb'] + Dir['spec/**/*.rb'] + %w(README.md)
  gem.executables   = []
  gem.test_files    = Dir['spec/**/*.rb']
  gem.name          = "soundreef"
  gem.require_paths = ["lib"]
  gem.version       = Soundreef::VERSION

  gem.add_dependency('hashie', '1.2.0')
  gem.add_development_dependency "rspec"
end
