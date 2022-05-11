module Blogging
  class Post < ApplicationRecord
    extend Mobility
    extend FriendlyId

    translates :slug, :title, type: :string
    translates :body, backend: :action_text
  
    friendly_id :title, use: :mobility

    belongs_to :author, class_name: Blogging.author_class
    
    has_and_belongs_to_many :tags, class_name: 'Blogging::Tag',
                                   association_foreign_key: :blogging_tag_id

    enum status: { draft: 0, published: 1 }

    validates :title, :body, presence: true
  end
end