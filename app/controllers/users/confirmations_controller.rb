# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  def create
    @email = resource_params[:email]
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?
    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(success: true, email: @email))
    else
      respond_with(resource)
    end
  end

  protected

  def after_resending_confirmation_instructions_path_for(resource_name)
    new_user_confirmation_path(resource_name)
  end
end
