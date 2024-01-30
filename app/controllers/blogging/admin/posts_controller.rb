# frozen_string_literal: true

module Blogging
  module Admin
    class PostsController < BaseController
      before_action :set_tags, only: %i[index new create edit update]
      before_action :set_authors, only: %i[new create edit update]
      before_action :set_post, only: %i[show edit update destroy]

      def index
        authorize Blogging::Post

        @pagy, @posts = pagy(Blogging::Post.with_rich_text_body_and_embeds.all)
      end

      def show; end

      def new
        @post = authorize Blogging::Post.new
      end

      def edit; end

      def create
        @post = authorize Blogging::Post.new(post_params)

        if @post.save
          redirect_to admin_posts_path,
                      notice: "#{t('activerecord.models.blogging/post')} #{t('notice.created')}"
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          redirect_to admin_posts_path,
                      notice: "#{t('activerecord.models.blogging/post')} #{t('notice.updated')}"
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy

        redirect_to admin_posts_path,
                    notice: "#{t('activerecord.models.blogging/post')} #{t('notice.destroyed')}"
      end

      private

      def set_tags
        @tags = Blogging::Tag.all
      end

      def set_authors
        @authors = Blogging.authors.call
      end

      def set_post
        @post = authorize Blogging::Post.friendly.find(params[:id])
      end

      def post_params
        params.require(:post).permit(
          :title, :body, :author_id, :cover_image,
          tag_ids: [], statuses_attributes: %i[id locale status blogging_post_id public_from]
        )
      end
    end
  end
end
