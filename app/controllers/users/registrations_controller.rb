# frozen_string_literal: true

# app/controllers/users/registrations_controller.rb

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @email = resource_params[:email]
    build_resource(sign_up_params)
    if resource.save
      redirect_to new_user_registration_path(success: true, email: @email)
    else
      respond_with(resource)
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
