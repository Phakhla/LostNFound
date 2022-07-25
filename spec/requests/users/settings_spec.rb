# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Settings', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'Get /users/settings/password/edit' do
    it 'view edit passsword page' do
      get password_edit_users_settings_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /users/settings/password' do
    it 'update new password' do
      params = { user: { current_password: 'password', password: 'new_password',
                         password_confirmation: 'new_password' } }

      put password_users_settings_path, params: params

      expect(response).to redirect_to(root_path)
    end

    it 'cannot update incorrect password' do
      params = { user: { current_password: 'password', password: '123456', password_confirmation: '000000' } }

      put password_users_settings_path, params: params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
