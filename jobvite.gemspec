# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jobvite/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Guterl"]
  gem.email         = ["michael@diminishing.org"]
  gem.description   = %q{Fetch jobs from Jobvite}
  gem.summary       = %q{Simple ruby wrapper for fetching jobs from Jobvite}
  gem.homepage      = "http://github.com/recruitmilitary/jobvite"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "jobvite"
  gem.require_paths = ["lib"]
  gem.version       = Jobvite::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_dependency 'nokogiri'
end
