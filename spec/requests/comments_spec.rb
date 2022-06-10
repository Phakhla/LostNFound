# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create(:user) }
  let(:my_post) { create(:post) }

  before do
    sign_in user
    my_post
  end

  describe 'POST /create' do
    it 'creates a comment' do
      post post_comments_path(my_post.id), params: { comment: { content: 'test' } }

      comment = Comment.last

      expect(comment.content).to eq('test')
    end
  end
end
