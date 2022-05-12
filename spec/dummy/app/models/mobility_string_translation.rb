class MobilityStringTranslation < ApplicationRecord
  belongs_to :translatable, polymorphic: true
end