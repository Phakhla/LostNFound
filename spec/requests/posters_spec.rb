# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posters', type: :request do
  let(:user) { create(:user) }
  let(:type) { create(:type) }
  let(:my_post) { create(:post, user:, type:) }

  before do
    sign_in user
    type
    my_post
  end

  describe 'GET /posts/:id/poster' do
    it 'create poster' do
      get new_post_poster_path(my_post.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
