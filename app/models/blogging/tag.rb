module Blogging
  class Tag < ApplicationRecord
    translates :name, type: :string

    validates :name, presence: true
  end
end
