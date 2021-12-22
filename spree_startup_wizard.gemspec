lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_startup_wizard/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_startup_wizard'
  s.version     = SpreeStartupWizard.version
  s.summary     = 'Adds a setup wizard to the admin dashboard.'
  s.description = s.summary
  s.required_ruby_version = '>= 3.0'

  s.author    = ['Collins Lagat', 'Ryanada Ltd']
  s.email     = ['info@olitt.com']
  s.homepage  = 'https://github.com/truehostcloud/spree-startup-wizard'
  s.license = 'BSD-3-Clause'

  s.files = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(%r{^spec/fixtures}) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 4.3.0'
  s.add_dependency 'spree', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_extension'

  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'spree_dev_tools'
end
