# frozen_string_literal: true

class Notification < ApplicationRecord
  include Noticed::Model

  belongs_to :recipient, polymorphic: true

  after_create_commit :update_notification_count
  after_create_commit :update_notification

  def self.latest_with_limit
    latest.limit(10)
  end

  def self.unread_latest_with_limit
    unread.latest_with_limit
  end

  private

  def update_notification_count
    broadcast_update_later_to(
      "notification_user_#{recipient.id}",
      target: 'notification_count',
      partial: 'notifications/count',
      locals: { count: recipient.notifications.unread.count }
    )
  end

  def update_notification
    broadcast_update_later_to(
      "notification_user_#{recipient.id}",
      target: 'notifications',
      partial: 'notifications/notifications',
      locals: {
        notifications: recipient.notifications.latest_with_limit.to_a,
        unread_notifications: recipient.notifications.unread_latest_with_limit.to_a
      }
    )
  end
end
