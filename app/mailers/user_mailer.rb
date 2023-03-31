class UserMailer < ApplicationMailer
  default from: 'admin@too.doo'

  def welcome_email
    @user = params[:user]
    mail to: @user.email, subject: 'Welcome to toodoo!'
  end
end
