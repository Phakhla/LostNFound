# frozen_string_literal: true

class CommentNotification < Noticed::Base
  deliver_by :database

  param :comment

  def message
    [
      comment.user.display_name,
      'ได้แสดงความคิดเห็นต่อโพสต์ของคุณ',
      comment.created_at.strftime('%d/%m/%Y %H.%M')
    ].join(' ')
  end

  def url
    post_path(comment.post)
  end

  def comment
    params[:comment]
  end
end
