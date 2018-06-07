# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-font-awesome-sass/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-font-awesome-sass'
  spec.version       = Jekyll::FontAwesomeSass::VERSION
  spec.authors       = ['andrew morton']
  spec.email         = ['drewish@katherinehouse.com']

  spec.summary       = 'A plugin to add Font Awesome to your Jekyll site.'
  spec.homepage      = 'https://github.com/drewish/jekyll-font-awesome-sass'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |file|
    file.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'jekyll', '>= 2.5', '< 4.0'
  spec.add_dependency 'font-awesome-sass', '>=4'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.0'
end
