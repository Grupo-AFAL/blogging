# frozen_string_literal: true

module Blogging
  class PostsController < ApplicationController
    before_action :set_post, only: %i[show]

    def index
      all = Blogging::Post.with_rich_text_body_and_embeds.descending.published_now
      @leader_post = all.first
      @pagy, @posts = pagy(all.offset(1), limit: 6, outset: 1)
    end

    def show; end

    private

    def set_post
      @post = Blogging::Post.published_now.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to posts_path,
                  alert: "#{t('activerecord.models.blogging/post')} #{t('notice.not_found')}"
    end
  end
end
