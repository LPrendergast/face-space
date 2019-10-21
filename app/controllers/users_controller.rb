class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
  end

  def edit
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
