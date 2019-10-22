class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to request.referrer
    end
  end

  def destroy
    session.destroy
    redirect_to request.referrer
  end
end
