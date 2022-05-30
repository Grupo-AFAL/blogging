# frozen_string_literal: true

module Blogging
  class Post < ApplicationRecord
    extend Mobility
    extend FriendlyId

    translates :slug, :title, type: :string
    translates :body, backend: :action_text

    friendly_id :title, use: %i[history mobility]

    has_one_attached :cover_image do |attachable|
      attachable.variant :original, resize_to_limit: [960, 0]
      attachable.variant :large, resize_to_limit: [960, 480]
      attachable.variant :medium, resize_to_limit: [400, 200]
    end

    belongs_to :author, class_name: Blogging.author_class.to_s

    has_and_belongs_to_many :tags, class_name: 'Blogging::Tag',
                                   association_foreign_key: :blogging_tag_id,
                                   foreign_key: :blogging_post_id

    enum status: { draft: 0, published: 1 }

    validates :title, :body, :public_from, :cover_image, presence: true
    validates :tag_ids, length: { minimum: 1 }
    validate :title_uniqueness

    scope :published_now, -> { where('public_from <= ?', Time.zone.now).published }

    scope :descending, -> { order('created_at DESC') }

    def self.available_title?(title)
      Blogging::Post.i18n.find_by(title: title).blank?
    end

    private

    def title_uniqueness
      return if !title_changed? || Blogging::Post.available_title?(title)

      errors.add(:title, :uniqueness)
    end

    # will change the slug if the title changed
    def should_generate_new_friendly_id?
      title_changed? && Blogging::Post.available_title?(title)
    end
  end
end
