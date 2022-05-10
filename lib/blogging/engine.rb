# frozen_string_literal: true

module Blogging
  class Engine < ::Rails::Engine
    isolate_namespace Blogging

    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.view_specs      false
      g.routing_specs   false
      g.helper          false
    end

    initializer 'Blogging precompile hook' do |app|
      if defined?(Sprockets)
        app.config.assets.precompile += %w[
          blogging/application.js
          blogging/application.css
        ]
      end
    end
  end
end
