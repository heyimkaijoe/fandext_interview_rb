class WelcomeMailer < ApplicationMailer
  default from: 'noreply@fandnext.jp'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to fandnext')
  end
end
