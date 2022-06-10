# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET Index' do
    it 'gets home page' do
      get root_path

      expect(response).to have_http_status(:ok)
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
