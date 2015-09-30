require File.expand_path( "../lib/middleman/test/version", __FILE__ )

Gem::Specification.new do |s|

  s.name          = 'middleman-test'
  s.version       = Middleman::Test::VERSION
  s.platform      = Gem::Platform::RUBY

  s.summary       = 'Minimal example of middleman tests'
  s.description   = %q{ Minimal example of middleman tests }
  s.authors       = ["Steven Sloan"]
  s.email         = "stevenosloan@gmail.com"
  s.homepage      = "http://github.com/stevenosloan/middleman-test"
  s.license       = "MIT"

  s.files         = Dir[ "{doc,lib}/**/*", "readme.md", "changelog.md" ]
  s.test_files    = Dir["spec/**/*.rb"]
  s.require_path  = "lib"

  # Utility
  s.add_dependency "middleman", [">= 3.1"]
  s.add_dependency "rack-test", ["~> 0.6.2"]

end
