# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_noticed_notifications

  validates :content, presence: true

  after_create_commit :notify_new_comment

  private

  def notify_new_comment
    CommentNotification.with(comment: self).deliver_later(post.user)
  end
end
