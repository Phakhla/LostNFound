# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  before do
    user
  end

  describe 'Register' do
    it 'GET /sign_up' do
      get new_user_registration_path

      expect(response).to have_http_status(:ok)
    end

    it 'Signup' do
      user = {
        email: 'signup@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      }
      post user_registration_path, params: { user: }

      expect(response).to redirect_to(root_path)
    end
  end

  describe 'Login' do
    it 'GET /sign_in' do
      get new_user_session_path

      expect(response).to have_http_status(:ok)
    end

    it 'Signin' do
      email = user.email
      user = { email:, password: 'password' }

      post user_session_path, params: { user: }

      expect(response).to redirect_to(root_path)
    end
  end

  describe 'Logout' do
    it 'Signout' do
      sign_in user
      get destroy_user_session_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'Forgot password' do
    it 'GET /password/new' do
      get new_user_password_path

      expect(response).to have_http_status(:ok)
    end

    it 'Send reset password' do
      email = user.email
      post user_password_path, params: { user: { email: } }

      expect(response).to have_http_status(:found)
    end

    it 'Update new password' do
      expect(user.password).to eq('password')

      user.send_reset_password_instructions
      user.reload
      reset_password_token = user.reset_password_token

      user = {
        reset_password_token:,
        password: '12345678',
        password_confirmation: '12345678'
      }
      put user_password_path, params: { user: }

      expect(user[:password]).to eq('12345678')
    end
  end
end
