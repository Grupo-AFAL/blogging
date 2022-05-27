# frozen_string_literal: true

module Blogging
  class PostsController < ApplicationController
    before_action :set_post, only: %i[show]

    def index
      leading_posts = 1
      all_posts = Blogging::Post.with_rich_text_body_and_embeds.recent.ispublished
      @leader_posts = all_posts.limit(leading_posts)
      @pagy, @posts = pagy(
        all_posts, items: 6, outset: leading_posts
      )
    end

    def show; end

    private

    def set_post
      @post = Blogging::Post.friendly.find(params[:id])
    end
  end
end
