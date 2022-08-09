# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET Index' do
    it 'gets home page' do
      get root_path

      expect(response).to have_http_status(:ok)
    end

    it 'gets lost_item with filter' do
      lost = create(:post, category: 'lost_item', status: 'closed')

      get root_path, params: { filter: { lost_item: { status: 'in_active' } } }

      expect(response.body).to include(lost.name)
      expect(response.body).to include('ปิดโพสต์')
    end

    it 'gets found_item with filter' do
      found = create(:post, category: 'found_item', status: 'active')

      get root_path, params: { filter: { found_item: { status: 'active' } } }

      expect(response.body).to include(found.name)
      expect(response.body).to include('found')
    end
  end

  describe 'listposts' do
    it 'show list lost and found' do
      found = create(:post, category: 'found_item')
      lost = create(:post, category: 'lost_item')

      get root_path
      expect(response.body).to include(found.name.to_s)
      expect(response.body).to include(found.location.to_s)

      expect(response.body).to include(lost.name.to_s)
      expect(response.body).to include(lost.location.to_s)
    end
  end

  describe 'GET Search Index' do
    it 'gets post with search' do
      post = create(:post)

      get root_path, params: { q: { name_cont: 'postname' } }

      expect(response.body).to include(post.name)
    end

    it 'not found search' do
      get root_path, params: { q: { name_cont: 'test' } }
      expect(response.body).to include('<p class="text-result">ไม่มีรายการแสดง</p>')
    end
  end
end
