# frozen_string_literal: true

module Blogging
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
