# frozen_string_literal: true

module Blogging
  module Admin
    class TagsController < BaseController
      before_action :set_tag, only: %i[edit update destroy]

      def new
        @tag = authorize Blogging::Tag.new
      end

      def edit; end

      def create
        @tag = authorize Blogging::Tag.new(tag_params)

        if @tag.save
          redirect_to admin_posts_path,
                      notice: "#{t('activerecord.models.blogging/tag')} #{t('notice.created')}"
        else
          render :new, status: :unprocessable_content
        end
      end

      def update
        if @tag.update(tag_params)
          redirect_to admin_posts_path,
                      notice: "#{t('activerecord.models.blogging/tag')} #{t('notice.updated')}"
        else
          render :edit, status: :unprocessable_content
        end
      end

      def destroy
        @tag.destroy

        redirect_to admin_posts_path,
                    notice: "#{t('activerecord.models.blogging/tag')} #{t('notice.destroyed')}"
      end

      private

      def set_tag
        @tag = authorize Blogging::Tag.find(params[:id])
      end

      def tag_params
        params.expect(tag: [:name])
      end
    end
  end
end
