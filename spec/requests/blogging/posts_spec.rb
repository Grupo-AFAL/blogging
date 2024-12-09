# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Published Posts', type: :request do
  fixtures 'blogging/posts', 'blogging/tags', 'action_text/rich_texts', :users,
           :mobility_string_translations, :mobility_text_translations,
           'blogging/post_statuses'

  let(:blog_post) { blogging_posts(:published) }
  let(:image) { fixture_file_upload('waldo.jpg', 'image/jpeg') }

  before { attach_image(blog_post, :cover_image, 'waldo.jpg') }

  describe '#index' do
    it { expect(get(posts_path)).to render_template(:index) }
  end

  describe '#show' do
    it { expect(get(post_path(blog_post))).to render_template(:show) }

    context 'when the id does not match any post' do
      it 'redirects to posts path with an alert' do
        get post_path('not-found')

        expect(response).to redirect_to(posts_path)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
