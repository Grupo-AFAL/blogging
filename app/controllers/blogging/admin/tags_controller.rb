# frozen_string_literal: true

module Blogging
  module Admin
    class TagsController < BaseController
      before_action :set_tag, only: %i[edit update destroy]

      def new
        @tag = Blogging::Tag.new
      end

      def create
        @tag = Blogging::Tag.new(tag_params)

        if @tag.save
          redirect_to admin_posts_path,
                      notice: "#{t('notice.created')} #{t('activerecord.models.blogging/tag')}"
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit; end

      def update
        if @tag.update(tag_params)
          redirect_to admin_posts_path,
                      notice: "#{t('notice.updated')} #{t('activerecord.models.blogging/tag')}"
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @tag.destroy

        redirect_to admin_posts_path,
                    notice: "#{t('notice.destroyed')} #{t('activerecord.models.blogging/tag')}"
      end

      private

      def set_tag
        @tag = Blogging::Tag.find(params[:id])
      end

      def tag_params
        params.require(:tag).permit(:name)
      end
    end
  end
end
