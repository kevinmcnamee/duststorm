# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'duststorm/version'

Gem::Specification.new do |s|
  s.name        = "duststorm"
  s.version     = Duststorm::VERSION
  s.authors     = ["Kevin Mcnamee"]
  s.email       = ["kevin@frothylabs.com"]
  s.homepage    = "https://github.com/kevinmcnamee/duststorm"
  s.summary     = %q{Multiple weather API ruby wrapper}
  s.description = %q{Multiple weather API ruby wrapper}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.license       = 'MIT'

  s.add_dependency('faraday')
  s.add_dependency('multi_json')
  s.add_dependency('hashie')

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('vcr')
  s.add_development_dependency('typhoeus')
end

