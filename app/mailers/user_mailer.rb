class UserMailer < ActionMailer::Base
  default :from => Settings[:email_from],
    :reply_to => Settings[:email_reply_to]

  def welcome_email(user)
    @user = user
    mail(:to => user.email, 
         :subject => "Welcome to Heritage")
  end
end
