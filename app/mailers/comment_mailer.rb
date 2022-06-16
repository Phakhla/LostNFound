# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  def comment_notification
    @comment = params[:comment]
    @recipient = params[:recipient]

    mail(to: @recipient.email, subject: 'New comment')
  end
end
