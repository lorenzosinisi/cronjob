# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cronjob/version'

Gem::Specification.new do |spec|
  spec.name          = "cronjob"
  spec.version       = Cronjob::VERSION
  spec.authors       = ["Lorenzo Sinisi"]
  spec.email         = ["lorenzo.sinisi@modomoto.de"]

  spec.summary       = %q{Online Cron Jobs Guardiano is a web based API service for scheduled or recurring tasks (cron jobs)}
  spec.description   = %q{Online Cron Jobs Guardiano is a web based API service for scheduled or recurring tasks (cron jobs). The API can be integrated into users' applications. Add new tasks via API and when the time comes, the API service will send an request to the url provided and the scheduled job starts. The API uses RESTful calls and responses are formatted in JSON.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "faraday"

  spec.add_development_dependency "webmock"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
