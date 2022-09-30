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

  def update
    if @user.update(user_params)
      redirect_to edit_user_registration_path, notice: 'Successful Update'
    else
      render :edit, status: :unprocessable_entity, layout: 'nav_white'
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def user_params
    params.require(:user).permit(
      :username, :email, :avatar, :tel, :facebook,
      :fblink, :address, :not_show_address
    )
  end
end
