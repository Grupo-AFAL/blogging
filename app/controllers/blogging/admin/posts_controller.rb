# frozen_string_literal: true

module Blogging
  module Admin
    class PostsController < ApplicationController
      before_action :set_tags, only: %i[index new create edit update]
      before_action :set_authors, only: %i[new create edit update]
      before_action :set_post, only: %i[show edit update destroy]

      def index
        @pagy, @posts = pagy(Blogging::Post.with_rich_text_body_and_embeds.all)
      end

      def show; end

      def new
        @post = Blogging::Post.new
      end

      def create
        @post = Blogging::Post.new(post_params)

        if @post.save
          redirect_to admin_posts_path,
                      notice: "#{t('notice.created')} #{t('activerecord.models.blogging/post')}"
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit; end

      def update
        if @post.update(post_params)
          redirect_to admin_posts_path,
                      notice: "#{t('notice.updated')} #{t('activerecord.models.blogging/post')}"
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy

        redirect_to admin_posts_path,
                    notice: "#{t('notice.destroyed')} #{t('activerecord.models.blogging/post')}"
      end

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
        params.require(:post).permit(:title, :body, :author_id, tag_ids: [])
      end
    end
  end
end
