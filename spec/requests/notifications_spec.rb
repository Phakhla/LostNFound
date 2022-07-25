# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notifications', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'show unread comment notifications' do
    post = create(:post, user:)
    comment = create(:comment, post:)

    get root_path

    expect(response.body).to include(comment.user.display_name)
    expect(response.body).to include(comment.content)
  end

  describe 'GET notifications' do
    it 'show all notifications page' do
      get notifications_path

      expect(response).to have_http_status(:ok)
    end
  end
end
