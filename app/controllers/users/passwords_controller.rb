# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  layout 'devise'
  before_action :load_email, only: %i[edit update]

  def create
    super do
      @email = resource_params[:email]
    end
  end

  def edit
    super
    return unless @email.blank? && params[:success].blank?

    redirect_to new_session_path(resource_name),
                alert: 'Reset password token is invaild'
  end

  protected

  def load_email
    reset_password_token = params[:reset_password_token] || params[:user][:reset_password_token]
    user = User.with_reset_password_token(reset_password_token)

    return unless user

    @email = user.email
  end

  def after_sending_reset_password_instructions_path_for(_resource_name)
    new_user_password_path(success: true, email: @email)
  end

  def after_resetting_password_path_for(_resource_name)
    edit_user_password_path(success: true, reset_password_token: 'skip_assert_reset_token_passed')
  end
end
