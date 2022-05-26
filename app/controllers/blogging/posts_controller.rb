# frozen_string_literal: true

module Blogging
  class PostsController < ApplicationController
    before_action :set_tags, only: %i[index show]
    before_action :set_authors, only: %i[show]
    before_action :set_post, only: %i[show]

    def index
      leading_posts = 1
      all_posts = Blogging::Post.with_rich_text_body_and_embeds.order('created_at DESC').published
      @leader_posts = all_posts.limit(leading_posts)
      @pagy, @posts = pagy(
        all_posts, items: 6, outset: leading_posts
      )
    end

    def show; end

    private

    def set_tags
      @tags = Blogging::Tag.all
    end

    def set_authors
      @authors = Blogging.authors.call
    end

    def set_post
      @post = Blogging::Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :author_id, :status, :public_from, tag_ids: [])
    end
  end
end
