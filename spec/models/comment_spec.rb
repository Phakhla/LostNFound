# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { create(:post) }
  let(:author) { create(:user) }

  it 'create notification after create' do
    comment = create(:comment, user: author)

    expect(comment.notifications_as_comment.count).to be > 0
  end
end
