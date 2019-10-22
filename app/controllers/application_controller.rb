class ApplicationController < ActionController::Base
  helper_method :current_user, :authorize_user
  before_action :set_extra_info #, except: [:current_user, :authorize_user]
  #skip_before_action :set_extra_info, only: [:]

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

  def set_extra_info
    if !current_user
      @current_user_name = "ljksenf"
    else
      
    @current_user_name = current_user.username
    end
  end


end
