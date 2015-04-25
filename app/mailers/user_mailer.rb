class UserMailer < ActionMailer::Base
  default from: "blocmarks@example.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/users/sign_in"
    mail(to: @user.email, subject: 'Welcome, welcome!')
  end
  
end
