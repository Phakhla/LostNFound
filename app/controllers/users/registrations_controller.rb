# frozen_string_literal: true

# app/controllers/users/registrations_controller.rb

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
