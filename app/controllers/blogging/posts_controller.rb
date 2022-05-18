# frozen_string_literal: true

module Blogging
  class PostsController < ApplicationController
    before_action :set_tags, only: %i[index show]
    before_action :set_authors, only: %i[show]
    before_action :set_post, only: %i[show]

    def index
      @pagy, @posts = pagy(Blogging::Post.with_rich_text_body_and_embeds.order("created_at DESC").all, items: 7)
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
