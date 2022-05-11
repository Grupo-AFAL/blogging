# frozen_string_literal: true

require 'blogging/version'
require 'blogging/engine'

module Blogging
  # ------------------------------ Author ------------------------------
  # configuration to set Author Class
  mattr_accessor :author_class
  author_class = 'User'

  # provide hook to configure attributes
  def self.config
    yield(self)
  end
end
