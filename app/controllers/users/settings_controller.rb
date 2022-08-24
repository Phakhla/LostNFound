# frozen_string_literal: true

class Users::SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: %i[password edit_password]
  before_action :check_password, only: %i[password]

  layout 'nav_white'

  def edit_password; end

  def password
    if @user.update_with_password(user_params)
      redirect_to root_path
    else
      render :edit_password, status: :unprocessable_entity
    end
  end

  private

  def check_password
    return unless user_params[:password] == user_params[:current_password]

    @password_duplicate = true
    render :edit_password, status: :unprocessable_entity
  end

  def load_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
