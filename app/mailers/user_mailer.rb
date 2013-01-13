class UserMailer < ActionMailer::Base
  default from: Settings[:email_from]

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Heritage")
  end
end
