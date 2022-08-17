# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentMailer, type: :mailer do
  let(:user) { create(:user, confirmed_at: Time.zone.now) }
  let(:owner) { create(:user, confirmed_at: Time.zone.now) }
  let(:my_post) { create(:post, user: owner) }

  before do
    user
    my_post
  end

  it 'send new comment email notification' do
    perform_enqueued_jobs do
      create(:comment, post: my_post, user:)
    end

    expect(ActionMailer::Base.deliveries.size).to eq(1)
  end
end
