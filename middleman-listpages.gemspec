# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-listpages/version"

Gem::Specification.new do |s|
  s.name        = "middleman-listpages"
  s.version     = Middleman::ListPages::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eric Strathmeyer"]
  s.email       = ["eric@vawks.com"]
  s.homepage    = "https://github.com/strathmeyer/middleman-listpages"
  s.summary     = %q{Adds listpages to Middleman}
  s.description = %q{Adds listpages to Middleman}

  s.rubyforge_project = "middleman-listpages"

  s.files         = `git ls-files -z`.split("\0")
  s.test_files    = `git ls-files -z -- {fixtures,features}/*`.split("\0")
  s.require_paths = ["lib"]

  s.add_dependency("middleman-core", ["~> 3.0.2"])
end
