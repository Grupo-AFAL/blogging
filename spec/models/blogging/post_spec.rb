# frozen_string_literal: true

require 'rails_helper'

module Blogging
  RSpec.describe Post, type: :model do
    fixtures 'blogging/posts', 'blogging/tags', :users, :mobility_string_translations,
             :mobility_text_translations

    let(:post) { Blogging::Post.new(@attributes) }
    let(:image) { fixture_file_upload('waldo.jpg', 'image/jpeg') }

    describe '#save' do
      before do
        @attributes = {
          title: 'Title',
          body: 'Body',
          author: users(:user),
          tag_ids: [blogging_tags(:fitness).id],
          cover_image: image,
          statuses_attributes: {
            0 => { locale: 'en', public_from: Time.zone.now, status: 0 }
          }
        }
      end

      context 'with valid attributes' do
        it { expect(post.save).to be true }
      end

      context 'with invalid attributes' do
        context 'when missing title' do
          before { @attributes[:title] = '' }

          it { expect(post.save).to be false }
        end

        context 'when missing body' do
          before { @attributes[:body] = '' }

          it { expect(post.save).to be false }
        end

        context 'when missing author' do
          before { @attributes[:author_id] = nil }

          it { expect(post.save).to be false }
        end

        context 'when missing tags' do
          before { @attributes[:tag_ids] = [] }

          it { expect(post.save).to be false }
        end

        context 'when missing public_from' do
          before { @attributes[:statuses_attributes][0][:public_from] = nil }

          it { expect(post.save).to be false }
        end

        context 'when missing cover_image' do
          before { @attributes[:cover_image] = nil }

          it { expect(post.save).to be false }
        end

        context 'when title has been taken' do
          before { @attributes[:title] = 'Fitness Post' }

          it { expect(post.save).to be false }
          it 'is expected to not save record' do
            expect(post.save).to be false
            expect(post.errors.added?(:title, :uniqueness)).to be true
          end
        end
      end
    end
  end
end
