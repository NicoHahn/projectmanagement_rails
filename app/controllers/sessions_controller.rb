class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

  def login

  end

  def welcome
    @user = current_user
  end

  def page_requires_login

  end

end
