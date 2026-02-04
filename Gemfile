# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in blogging.gemspec.
gemspec

gem 'pg'
gem 'rails', '~> 8.0'

gem 'bali_view_components', github: 'Grupo-AFAL/bali-view-components', branch: 'main'
# gem 'bali_view_components', path: ENV['BALI_VIEW_COMPONENTS_PATH']
gem 'friendly_id', '~> 5.4.0'
gem 'friendly_id-mobility', '~> 1.0.4'
gem 'image_processing', '~> 1.2'
gem 'lucide-rails'
gem 'mobility', '~> 1.3'
gem 'mobility-actiontext'
gem 'pagy', '~> 43.0'
gem 'propshaft'
gem 'pundit', '~> 2.2'
gem 'rrule', git: 'https://github.com/square/ruby-rrule'
gem 'simple_command'
gem 'tailwindcss-rails', '~> 4.0'
gem 'turbo-rails', '~> 2.0'

gem 'ruby-vips', '~> 2.1', group: :vips

group :development do
  gem 'puma', '< 7'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 7.0'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'vite_rails', '~> 3.0'
end

# Start debugger with binding.b [https://github.com/ruby/debug]
gem 'debug', '>= 1.0.0'

gem 'tzinfo-data'
