class SessionsController < ApplicationController

  def new #Defensive programming bad
    if !current_user
      render :new
    else
      redirect_to current_user
    end
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path
  end
end
