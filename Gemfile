source 'https://rubygems.org'

gem 'deface'
spree_opts = '>= 4.4.0.rc1'
gem 'spree', spree_opts
gem 'spree_backend', spree_opts

group :test do
  gem 'rails-controller-testing'
end

group :development do
  gem 'rcodetools', require: false
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'solargraph', require: false
  gem 'spree_sample', spree_opts, require: false
end

gemspec
