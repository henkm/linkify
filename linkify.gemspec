# -*- encoding: utf-8 -*-
require File.expand_path('../lib/linkify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Henk Meijer"]
  gem.email         = ["meijerhenk@gmail.com"]
  gem.description   = %q{Lists all the available routes in your rails app, to add internal linking to admin pages}
  gem.summary       = %q{Linky lists all the possible routes in your Rails app in a drop-down menu}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "linkify"
  gem.require_paths = ["lib"]
  gem.version       = Linkify::VERSION
end
