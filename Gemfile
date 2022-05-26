# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in blogging.gemspec.
gemspec

gem 'pg'

gem 'bali_view_components', github: 'Grupo-AFAL/bali-view-components', branch: 'card-component'
# gem 'bali_view_components', path: '../bali-view-components'
gem 'bulma-rails', '~> 0.9.3'
gem 'friendly_id', '~> 5.4.0'
gem 'friendly_id-mobility', '~> 1.0.3'
gem 'frontend_helpers', github: 'Grupo-AFAL/frontend-helpers', branch: 'main'
gem 'image_processing', '~> 1.2'
gem 'jsbundling-rails'
gem 'mobility', '~> 1.2.6'
gem 'mobility-actiontext'
gem 'pagy', '~> 5.6'
gem 'pundit', '~> 2.2'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'turbo-rails', '~> 1.0'

gem 'ruby-vips', '~> 2.1', group: :vips

group :development do
  gem 'puma', '~> 5.6'
  gem 'rubocop', '~> 1', require: false
  gem 'rubocop-rails', '~> 2'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'simplecov', require: false
end

# Start debugger with binding.b [https://github.com/ruby/debug]
gem 'debug', '>= 1.0.0'

gem 'tzinfo-data'
