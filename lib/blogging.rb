# frozen_string_literal: true

require 'blogging/version'
require 'blogging/engine'

module Blogging
  # ------------------------------ Author ------------------------------
  # configuration to set Author Class

  # rubocop: disable Lint/UselessAssignment: Useless assignment to variable
  mattr_accessor :author_class
  author_class = 'User'
  # rubocop: enable Lint/UselessAssignment: Useless assignment to variable

  # provide hook to configure attributes
  def self.config
    yield(self)
  end
end
