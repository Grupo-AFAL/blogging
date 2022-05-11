module Blogging
  class Post < ApplicationRecord
    extend Mobility
    extend FriendlyId

    translates :slug, :title, type: :string
    translates :body, backend: :action_text
  
    friendly_id :title, use: :mobility

    belongs_to :author, class_name: Blogging.author_class

    enum status: { draft: 0, published: 1 }

    validates :title, :body, presence: true
  end
end