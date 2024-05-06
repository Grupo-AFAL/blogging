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
        app.config.assets.precompile += %w[blogging/application.css]

        dir_path = root.join('app', 'assets', 'javascripts')
        Dir[File.join(dir_path, 'blogging', '**', '*.js')].each do |path|
          app.config.assets.precompile << path.gsub("#{dir_path.to_path}/", '')
        end
      end
    end
  end
end
