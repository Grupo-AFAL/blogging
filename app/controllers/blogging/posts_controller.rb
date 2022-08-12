# frozen_string_literal: true

module Blogging
  class PostsController < ApplicationController
    before_action :set_post, only: %i[show]

    def index
      all_posts = Blogging::Post.with_rich_text_body_and_embeds.descending.published_now
      @leader_post = all_posts.first
      @pagy, @posts = pagy(
        all_posts, items: 6, outset: 1
      )
    end

    def show; end

    private

    def set_post
      @post = Blogging::Post.published_now.friendly.find(params[:id])
    end
  end
end
