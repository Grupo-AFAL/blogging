# frozen_string_literal: true

module Blogging
  class Post < ApplicationRecord
    extend Mobility
    extend FriendlyId

    translates :slug, :title, type: :string
    translates :body, backend: :action_text

    friendly_id :title, use: [:history, :mobility]

    belongs_to :author, class_name: Blogging.author_class.to_s

    has_and_belongs_to_many :tags, class_name: 'Blogging::Tag',
                                   association_foreign_key: :blogging_tag_id,
                                   foreign_key: :blogging_post_id

    enum status: { draft: 0, published: 1 }

    validates :title, :body, presence: true
    validate :title_uniqueness
    validate :tags_presence

    def self.available_title?(title)
      Blogging::Post.i18n.find_by(title: title).blank?
    end

    private

    def tags_presence
      return if tag_ids.size.positive?

      errors.add(:tag_ids, :blank)
    end

    def title_uniqueness
      return if !title_changed? || Blogging::Post.available_title?(title)

      errors.add(:title, :uniqueness)
    end

    def should_generate_new_friendly_id? #will change the slug if the name changed
      title_changed? && Blogging::Post.available_title?(title)
    end
  end
end
