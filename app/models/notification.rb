# frozen_string_literal: true

class Notification < ApplicationRecord
  include Noticed::Model

  belongs_to :recipient, polymorphic: true

  after_create_commit :update_notification_count
  after_create_commit :prepend_new_notification

  private

  def update_notification_count
    broadcast_update_later_to(
      "notification_user_#{recipient.id}",
      target: 'notification_count',
      partial: 'notifications/count',
      locals: { count: recipient.notifications.unread.count }
    )
  end

  def prepend_new_notification
    broadcast_prepend_later_to("notification_user_#{recipient.id}")
  end
end
