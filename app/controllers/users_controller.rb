class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :email, :password))
    session[:user_id] = @user.id

    UserMailer.with(user: @user).welcome_email.deliver_later

    redirect_to '/welcome'
  end
end
