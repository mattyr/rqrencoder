# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rqrencoder/version"

Gem::Specification.new do |s|
  s.name        = "rqrencoder"
  s.version     = RQREncoder::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matt Robinson"]
  s.email       = ["robinson.matty@gmail.com"]
  s.homepage    = "http://github.com/mattyr/rqrencoder"
  s.summary     = %q{A simple ruby QR Code generator with C backing for speed}
  s.description = %q{A simple ruby QR Code generator with C backing for speed}

  s.rubyforge_project = "rqrencoder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
	s.extensions << 'ext/rqrencoder/extconf.rb'
end
