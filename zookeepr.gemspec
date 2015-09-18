# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = 'zookeepr'
  spec.version       = 1
  spec.authors       = ['James Michael DuPont']
  spec.email         = ['jamesmikedupont@gmail.com']
  spec.description   = %q{Chef recipe for zookeepr}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/h4ck3rm1k3/zookeepr-chef-recipe.git'
  spec.license       = 'GNU Public License 3.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'


end
