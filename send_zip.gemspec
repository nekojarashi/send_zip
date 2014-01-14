# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'send_zip/version'

Gem::Specification.new do |spec|
  spec.name          = "send_zip"
  spec.version       = SendZip::VERSION
  spec.authors       = ["Misaki Kawamura", "Shuntaro Shitasako"]
  spec.email         = ["misaki@nekojarashi.com"]
  spec.description   = %q{Sends the files with being zipped dynamically. Similar interface to "send_file" of Rails. }
  spec.summary       = %q{Sends the files with being zipped dynamically.}
  spec.homepage      = "https://github.com/nekojarashi/send_zip"
  spec.license       = "GPLV2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency("zipping", ["~> 0.2.3"])
end
