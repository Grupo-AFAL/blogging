module Blogging
  class Tag < ApplicationRecord
    translates :name, type: :string

    has_and_belongs_to_many :posts, class_name: 'Blogging::Post',
                                    association_foreign_key: :blogging_post_id,
                                    foreign_key: :blogging_tag_id

    validates :name, presence: true
  end
end
