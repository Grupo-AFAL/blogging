# frozen_string_literal: true

class MobilityStringTranslation < ApplicationRecord
  belongs_to :translatable, polymorphic: true
end
