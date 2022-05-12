# frozen_string_literal: true

class MobilityTextTranslation < ApplicationRecord
  belongs_to :translatable, polymorphic: true
end
