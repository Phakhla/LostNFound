# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  def create
    super do
      @email = resource_params[:email]
    end
  end

  protected

  def after_sending_reset_password_instructions_path_for(_resource_name)
    new_user_password_path(success: true, email: @email)
  end
end
