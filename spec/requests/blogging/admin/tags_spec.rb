# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Tags', type: :request do
  fixtures 'blogging/tags', :mobility_string_translations

  let(:tag) { blogging_tags(:fitness) }

  describe '#new' do
    it { expect(get(new_admin_tag_path)).to render_template(:new) }
  end

  describe '#create' do
    before do
      @params = {
        tag: {
          name: 'Fitness'
        }
      }
    end

    context 'with valid params' do
      it 'is expected to have http status found' do
        post admin_tags_path, params: @params

        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid params' do
      context 'when missing name' do
        before { @params[:tag][:name] = '' }

        it 'is expected to have http status unprocessable entity' do
          post admin_tags_path, params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe '#edit' do
    it { expect(get(edit_admin_tag_path(tag))).to render_template(:edit) }
  end

  describe '#update' do
    before do
      @params = {
        tag: {
          name: 'Sleep'
        }
      }
    end

    context 'with valid params' do
      it 'is expected to have http status found' do
        put admin_tag_path(tag), params: @params

        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid params' do
      context 'when missing name' do
        before { @params[:tag][:name] = '' }

        it 'is expected to have http status unprocessable entity' do
          put admin_tag_path(tag), params: @params

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe '#destroy' do
    it 'is expected to have http status found' do
      delete admin_tag_path(tag)

      expect(response).to have_http_status(:found)
    end
  end
end
