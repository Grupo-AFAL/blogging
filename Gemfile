# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in blogging.gemspec.
gemspec

gem 'pg'

gem 'bali_view_components', github: 'Grupo-AFAL/bali-view-components',
                            branch: 'add-level-column-table-components'
gem 'bulma-rails', '~> 0.9.3'
gem 'friendly_id', '~> 5.4.0'
gem 'friendly_id-mobility', '~> 1.0.3'
gem 'frontend_helpers', github: 'Grupo-AFAL/frontend-helpers',
                        branch: 'display-datepicker-with-correct-locale'
gem 'jsbundling-rails'
gem 'mobility', '~> 1.2.6'
gem 'mobility-actiontext'
gem 'pagy', '~> 5.6'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'turbo-rails', '~> 1.0'

group :development do
  gem 'puma', '~> 5.6'
  gem 'rubocop', '~> 1', require: false
  gem 'rubocop-rails', '~> 2'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.0.0'
end

# Start debugger with binding.b [https://github.com/ruby/debug]
gem 'debug', '>= 1.0.0'
