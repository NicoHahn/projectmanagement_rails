class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password, :firstname, :lastname, :email))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def accept_invitaion
    notification = Notification.find(params[:invitation_id].to_i)
    if notification
      membership = notification.associatable
      membership.update(status: 'accepted')
      redirect_to company_path(membership.company_id)
    else
      ""
    end
  end

  def decline_invitaion
    notification = Notification.find(params[:invitation_id].to_i)
    if notification
      membership = notification.associatable
      membership.update(status: 'declined')
      redirect_to company_path(membership.company_id)
    else
      ""
    end
  end

end
