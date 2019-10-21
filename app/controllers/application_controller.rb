class ApplicationController < ActionController::Base
  helper_method :current_user, :authorize_user

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def authorize_user
    unless current_user
      flash[:notice] = "Please Login."
      redirect_to new_session
    end
  end
end
