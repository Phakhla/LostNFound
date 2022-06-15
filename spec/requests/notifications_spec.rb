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

    expect(response.body).to include("#{comment.user.display_name} ได้แสดงความคิดเห็นต่อโพสต์ของคุณ")
  end
end
