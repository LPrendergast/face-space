class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @pages = @user.pages
  end

  def index
    @users = User.all
  end

  def new #In the future, users should be notified they must logout to signup again
    if !current_user
      @user = User.new
    else
      redirect_to current_user
    end
  end

  def create
    @user = User.create(user_params(:username))
    session[:user_id] = @user.id
    redirect_to @user
  end

  def edit
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
