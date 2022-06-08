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
      found = create(:post, category:'found_item')
      lost = create(:post, category:'lost_item')

      get root_path
      expect(response.body).to include("#{found.name}")
      expect(response.body).to include("#{found.date}")
      expect(response.body).to include("#{found.location}")

      expect(response.body).to include("#{lost.name}")
      expect(response.body).to include("#{lost.date}")
      expect(response.body).to include("#{lost.location}")
     
    end
  end

end
