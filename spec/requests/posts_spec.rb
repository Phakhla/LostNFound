# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }
  let(:my_post) { create(:post, user:) }

  before do
    sign_in user
    my_post
  end

  describe 'GET /posts/new' do
    it 'return success' do
      get new_post_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/search' do
    it 'gets result page' do
      get search_posts_path

      expect(response.body).to include('<h1>ผลลัพธ์การค้นหา</h1>')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/lost' do
    it 'gets lost page' do
      get lost_posts_path

      expect(response.body).to include('<h3>รายการประกาศตามหาของหาย</h3>')
      expect(response).to have_http_status(:ok)
    end

    it 'gets lost page with search' do
      lost = create(:post,  name: 'test', category: 'lost_item')

      q = { name_cont: 'test' }

      get lost_posts_path, params: { q: }

      expect(response.body).to include(lost.name)
    end
  end

  describe 'GET /posts/found' do
    it 'gets found page' do
      get found_posts_path

      expect(response.body).to include('<h3>รายการประกาศตามหาเจ้าของ</h3>')
      expect(response).to have_http_status(:ok)
    end

    it 'gets found page with search' do
      found = create(:post,  name: 'test', category: 'found_item')
      q = { name_cont: 'test' }

      get found_posts_path, params: { q: }

      expect(response.body).to include(found.name)
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
    it 'Create POST with no attachments' do
      post = {
        name: 'test',
        category: 'found_item',
        types: 'other',
        status: 'no_found',
        date: Time.zone.now,
        time: Time.zone.now,
        location: 'locationname',
        detail: 'detailname'
      }
      post posts_path, params: { post: }

      post = Post.last

      expect(response).to redirect_to(root_path)
      expect(post.images_attachments.size).to eq(0)
    end

    it 'Create POST with attachments' do
      post = {
        name: 'test',
        category: 'found_item',
        types: 'other',
        status: 'no_found',
        date: Time.zone.now,
        time: Time.zone.now,
        location: 'locationname',
        detail: 'detailname',
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
        types: 'other',
        status: 'no_found',
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
      expect(response.body).to include(my_post.category)
      expect(response.body).to include(my_post.status)
    end

    it 'mark all comments as read' do
      create(:comment, post: my_post)

      get post_path(my_post)

      expect(user.notifications.unread.count).to eq(0)
    end
  end

  describe 'Advance Search Modal' do
    it 'return result page' do
      q = {
        category_eq_any: ['0'],
        name_cont: 'test',
        types_eq: '1',
        date_gteq: '2022-06-15',
        date_lteq: '2022-06-24'
      }
      get search_posts_path(q)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(my_post.name)
    end
  end
end
