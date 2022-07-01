# frozen_string_literal: true

class Users::SettingsController < ApplicationController
  before_action :authenticate_user!

  def edit_password
    @user = current_user
  end

  def password
    @user = current_user
    if @user.update_with_password(user_params)
      redirect_to root_path
    else
      render :edit_password, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
