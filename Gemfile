# frozen_string_literal: true

source 'https://rubygems.org'

gem 'berkshelf'
gem 'chefspec'
gem 'docker'
gem 'foodcritic'
gem 'kitchen-dokken'
gem 'public_suffix', '= 4.0.3'
gem 'rake'
gem 'rspec'
gem 'rubocop'
gem 'thor', '~> 0.19'

group :travis do
  gem 'test-kitchen', '~> 2.3.4'
end

group :local do
  gem 'kitchen-vagrant', '~> 1.6.1'
  gem 'vagrant-wrapper'
end
