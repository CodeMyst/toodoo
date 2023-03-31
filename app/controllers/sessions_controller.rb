class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:login_page, :login, :welcome]

  def login_page
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/todos'
    else
      redirect_to '/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end

  def welcome
  end

  def page_requires_login
  end
end
