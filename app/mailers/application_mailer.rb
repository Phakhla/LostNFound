# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Figaro.env.EMAIL_FROM
  layout 'mailer'
end
