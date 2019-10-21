class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :check_user_belongs_to_current_user, only: [:edit, :update]

  def show

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

  def update

    @user.update(user_params(:username))
    redirect_to @user
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

  def check_user_belongs_to_current_user

    unless find_user == current_user
      #flashy boy
      redirect_to find_user
    end
  end

  def find_user
    @user = User.find(params[:id])
  end
end