# frozen_string_literal: true

require 'rails_helper'

module Blogging
  RSpec.describe Post, type: :model do
    fixtures :users

    let(:post) { Blogging::Post.new(@attributes) }

    describe '#save' do
      before do
        @attributes = {
          title: 'Title',
          body: 'Body',
          author: users(:user)
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
          before { @attributes[:author] = nil }

          it { expect(post.save).to be false }
        end
      end
    end
  end
end
