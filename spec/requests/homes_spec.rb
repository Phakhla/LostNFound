# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET Index' do
    it 'gets home page' do
      get root_path

      expect(response).to have_http_status(:ok)
    end

    it 'gets search result' do
      found = create(:post, name: 'test', category: 'found_item')
      lost = create(:post, name: 'test', category: 'lost_item')

      q = { name_cont: 'test' }

      get root_path, params: { q: }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(found.name)
      expect(response.body).to include(lost.name)
    end

    it 'gets lost_item with filter' do
      lost = create(:post, category: 'lost_item', status: 'closed')

      get root_path, params: { filter: { lost_item: { status: 'in_active' } } }

      expect(response.body).to include(lost.name)
      expect(response.body).to include('closed')
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
      expect(response.body).to include(found.date.to_s)
      expect(response.body).to include(found.location.to_s)

      expect(response.body).to include(lost.name.to_s)
      expect(response.body).to include(lost.date.to_s)
      expect(response.body).to include(lost.location.to_s)
    end
  end
end
