# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentMailer, type: :mailer do
  it 'send new comment email notification' do
    perform_enqueued_jobs do
      create(:comment)
    end

    expect(ActionMailer::Base.deliveries.size).to eq(1)
  end
end
