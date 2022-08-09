# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }
  let(:type) { create(:type) }
  let(:my_post) { create(:post, user:, type:) }

  before do
    sign_in user
    type
    my_post
  end

  describe 'GET /posts/new' do
    it 'return success' do
      get new_post_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /posts/search' do
    it 'show result search' do
      q = {
        category_eq_any: [Post.categories[my_post.category]],
        name_cont: my_post.name,
        type_id_eq: my_post.type_id
      }

      post search_posts_path, params: { lat: my_post.lat, lng: my_post.lng, q: }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(my_post.name)
    end
  end

  describe 'GET /posts/lost' do
    it 'gets lost page' do
      get lost_posts_path, params: { filter: { lost_item: { status: 'in_active' } } }

      expect(response.body).to include('<h4>รายการโพสต์ตามหาของทั้งหมด(0)</h4>')
      expect(response).to have_http_status(:ok)
    end

    it 'gets lost_item with search' do
      lost = create(:post,  name: 'test', category: 'lost_item')

      get lost_posts_path, params: { q: { name_cont: 'test' } }

      expect(response.body).to include(lost.name)
    end

    it 'not found search' do
      get lost_posts_path, params: { q: { name_cont: 'test' } }
      expect(response.body).to include('<p class="text-result">ไม่มีรายการแสดง</p>')
    end

    it 'gets lost with filter' do
      lost = create(:post, name: 'test', category: 'lost_item', status: 'closed')

      get lost_posts_path, params: { filter: { lost_item: { status: 'in_active' } } }

      expect(response.body).to include(lost.name)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/found' do
    it 'gets found page' do
      get found_posts_path, params: { filter: { found_item: { status: 'active' } } }

      expect(response.body).to include('<h4>รายการโพสต์ตามหาเจ้าของทั้งหมด(1)</h4>')
      expect(response).to have_http_status(:ok)
    end

    it 'gets found page with search' do
      found = create(:post,  name: 'test', category: 'found_item')
      q = { name_cont: 'test' }

      get found_posts_path, params: { q: }

      expect(response.body).to include(found.name)
    end

    it 'not found search' do
      get found_posts_path, params: { q: { name_cont: 'test' } }
      expect(response.body).to include('<p class="text-result">ไม่มีรายการแสดง</p>')
    end

    it 'gets found with filter' do
      post = create(:post, name: 'test', category: 'found_item', status: 'active')

      get found_posts_path, params: { filter: { found_item: { status: 'active' } } }

      expect(response.body).to include(post.name)
      expect(response.body).to include('found')
    end
  end

  describe 'GET /posts/autocomplete' do
    it 'gets search autocomplete' do
      q = 'test'
      get autocomplete_posts_path, params: { q: }

      expect(q).to include('test')
    end
  end

  describe 'POST /posts' do
    it 'Create POST with attachments' do
      post = {
        name: 'test',
        category: 'found_item',
        status: 'active',
        date: Time.zone.now,
        time: Time.zone.now,
        lat: 10.00000,
        lng: 10.00000,
        detail: 'detailname',
        type_id: type.id,
        images: [fixture_file_upload(file_fixture('user-icon.png'))]
      }
      post posts_path, params: { post: }

      post = Post.last

      expect(response).to redirect_to(root_path)
      expect(post.images_attachments.size).to eq(1)
    end

    it 'Create failed' do
      post = {
        category: 'found_item',
        status: 'active',
        date: Time.zone.now,
        time: Time.zone.now,
        location: 'locationname',
        detail: 'detailname'
      }
      post posts_path, params: { post: }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /post/id' do
    it 'get post from id' do
      get post_path(my_post.id)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(my_post.name)
      expect(response.body).to include(my_post.detail)
    end

    it 'mark all comments as read' do
      create(:comment, post: my_post)

      get post_path(my_post)

      expect(user.notifications.unread.count).to eq(0)
    end
  end

  describe 'GET /posts/id/edit' do
    it 'owner should gets edit' do
      get edit_post_path(my_post)

      expect(response).to have_http_status(:ok)
    end

    it 'not owner should not gets edit' do
      user2 = create(:user)

      sign_out user
      sign_in user2

      get edit_post_path(my_post)

      expect(response).to have_http_status(:found)
    end

    it 'not owner should not update' do
      user2 = create(:user)

      sign_out user
      sign_in user2

      patch post_path(my_post)

      expect(response).to redirect_to(post_path)
    end
  end

  describe 'DELETE /posts/id' do
    it 'delete post' do
      delete "/posts/#{my_post.id}"
      expect(response).to redirect_to(root_path)
    end
  end
end
