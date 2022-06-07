# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET Index' do
    it 'gets home page' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
