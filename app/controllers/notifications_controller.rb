# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tab, only: [:index]

  def index
    @q = Notification.ransack(params[:q])
    result = @q.result
    @notifications = result.order(created_at: :desc).page(params[:page]).per(10)
  end

  def set_tab
    @tab = params.dig(:q, :tab) || 'all'
  end
end
