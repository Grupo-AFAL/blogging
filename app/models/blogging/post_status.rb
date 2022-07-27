# frozen_string_literal: true

module Blogging
  class PostStatus < ApplicationRecord
    belongs_to :post, class_name: 'Blogging::Post',
                      foreign_key: :blogging_post_id,
                      inverse_of: :statuses

    enum status: { draft: 0, published: 1 }

    validates :public_from, presence: true
  end
end
