# frozen_string_literal: true

require 'blogging/version'
require 'blogging/engine'

module Blogging
  # ------------------------------ Author ------------------------------
  # configuration to set Author Class

  mattr_accessor :author_class, default: 'User'
  mattr_accessor :authors, default: -> { User.all }
  mattr_accessor :author_name, default: lambda { |author| author.name }

  mattr_accessor :parent_controller, default: 'ActionController::Base'
  mattr_accessor :parent_admin_controller, default: 'Blogging::ApplicationController'


  # provide hook to configure attributes
  def self.config
    yield(self)
  end
end
