# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ldappwd/version"

Gem::Specification.new do |spec|
  spec.name          = "ldappwd"
  spec.version       = Ldappwd::VERSION
  spec.authors       = ["Javier Juarez"]
  spec.email         = ["javier.juarez@gmail.com"]

  spec.summary       = %q{This cli helps creating SSHA passwords for the LDAP.}
  spec.description   = %q{The aim of this mini-tool is to help with the cumbersome process of password generation}
  spec.homepage      = "https://github.com/jjuarez/ldappwd"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

# spec.add_dependency "json", "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end

