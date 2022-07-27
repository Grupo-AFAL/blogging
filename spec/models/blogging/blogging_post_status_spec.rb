# frozen_string_literal: true

require 'rails_helper'

module Blogging
  RSpec.describe PostStatus, type: :model do
    fixtures 'blogging/posts'

    let(:post) { blogging_posts(:published) }
    let(:post_status) { Blogging::PostStatus.new(@attributes) }

    before { @attributes = {} }

    describe '#save' do
      context 'with valid attributes' do
        before { @attributes.merge!(locale: 'en', public_from: Time.zone.now, post: post) }

        it { expect(post_status.save).to be_truthy }
      end

      context 'with invalid attributes' do
        context 'when missing locale' do
          before { @attributes.merge!(public_from: Time.zone.now, post: post) }

          it 'fails to create' do
            expect(post_status.save).to be_falsey
            expect(post_status.errors.added?(:locale, :blank)).to be_truthy
          end
        end

        context 'when missing public from' do
          before { @attributes.merge!(locale: 'en', post: post) }

          it 'fails to create' do
            expect(post_status.save).to be_falsey
            expect(post_status.errors.added?(:public_from, :blank)).to be_truthy
          end
        end

        context 'when missing post' do
          before { @attributes.merge!(locale: 'en', public_from: Time.zone.now) }

          it 'fails to create' do
            expect(post_status.save).to be_falsey
            expect(post_status.errors.added?(:post, :blank)).to be_truthy
          end
        end
      end
    end
  end
end
