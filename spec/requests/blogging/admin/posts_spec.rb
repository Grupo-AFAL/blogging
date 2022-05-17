# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Posts', type: :request do
  fixtures 'blogging/posts', 'blogging/tags', :users, :mobility_string_translations,
           :mobility_text_translations

  let(:blog_post) { blogging_posts(:published) }

  describe '#index' do
    it { expect(get(admin_posts_path)).to render_template(:index) }
  end

  describe '#show' do
    it { expect(get(admin_post_path(blog_post))).to render_template(:show) }
  end

  describe '#new' do
    it { expect(get(new_admin_post_path)).to render_template(:new) }
  end

  describe '#create' do
    before do
      @params = { post: {
        title: 'Title',
        body: 'Body',
        author_id: users(:user).id,
        tag_ids: [blogging_tags(:fitness).id],
        public_from: Time.zone.now
      } }
    end

    context 'with valid params' do
      it 'is expected to have http status unprocessable found' do
        post admin_posts_path, params: @params

        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid params' do
      context 'when missing title' do
        before { @params[:post][:title] = '' }

        it 'is expected to have http status unprocessable entity' do
          post admin_posts_path, params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when missing body' do
        before { @params[:post][:body] = '' }

        it 'is expected to have http status unprocessable entity' do
          post admin_posts_path, params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when missing author' do
        before { @params[:post][:author_id] = nil }

        it 'is expected to have http status unprocessable entity' do
          post admin_posts_path, params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when missing tags' do
        before { @params[:post][:tag_ids] = [] }

        it 'is expected to have http status unprocessable entity' do
          post admin_posts_path, params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe '#edit' do
    it { expect(get(edit_admin_post_path(blog_post))).to render_template(:edit) }
  end

  describe '#update' do
    before do
      @params = { post: {
        title: 'Title',
        body: 'Body',
        author_id: users(:user).id,
        tag_ids: [blogging_tags(:fitness).id]
      } }
    end

    context 'with valid params' do
      it 'is expected to have http status unprocessable found' do
        put admin_post_path(blog_post), params: @params

        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid params' do
      context 'when missing title' do
        before { @params[:post][:title] = '' }

        it 'is expected to have http status unprocessable entity' do
          put admin_post_path(blog_post), params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when missing body' do
        before { @params[:post][:body] = '' }

        it 'is expected to have http status unprocessable entity' do
          put admin_post_path(blog_post), params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when missing author' do
        before { @params[:post][:author_id] = nil }

        it 'is expected to have http status unprocessable entity' do
          put admin_post_path(blog_post), params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when missing tags' do
        before { @params[:post][:tag_ids] = [] }

        it 'is expected to have http status unprocessable entity' do
          put admin_post_path(blog_post), params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe '#destroy' do
    it 'is expected to have http status ok' do
      delete admin_post_path(blog_post)

      expect(response).to have_http_status(:found)
    end
  end
end
