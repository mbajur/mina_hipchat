$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mina_hipchat/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mina_hipchat"
  s.version     = MinaHipchat::VERSION
  s.authors     = ["Mike Bajur"]
  s.email       = ["mbajur@gmail.com"]
  s.homepage    = "http://github.com/mbajur"
  s.summary     = "Mina bindings for HipChat"
  s.description = "Adds tasks to aid in the hipchat notifications"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "mina"
end
