# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  layout :layout_by_resource

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username tel email password
                                                         password_confirmation address fblink facebook])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username tel email password
                                                                password_confirmation address fblink avatar facebook
                                                                not_show_address ])
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  private

  def layout_by_resource
    if devise_controller?
      if action_name == 'edit'
        'devise_sign_in'
      else
        'devise'
      end
    elsif %w[new show edit category_selects].include?(action_name)
      'nav_white'
    elsif %w[changelog].include?(action_name)
      'nav_white_without_footer'
    else
      'application'
    end
  end
end
