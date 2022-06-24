# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.all.order(created_at: :desc).page(params[:page]).per(10)
  end
end
