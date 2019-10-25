class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]
  before_action :check_user_belongs_to_current_user, only: %i[edit update]
  before_action :authorize_user, only: %i[edit update]
  
  def show
    
    @posts = @user.posts
    @pages = @user.pages
  end

  def search
    @users = User.all.where('username LIKE ?', "#{params[:search]}%")
    render :index
  end

  def index
    @users = User.all
  end

  def new # In the future, users should be notified they must logout to signup again
    if !current_user
      @user = User.new
    else
      redirect_to current_user
    end
  end

  def create

    @user = User.create(user_params(:username, :password, :bio, :hobbies, :age, :country, :city, :phone_number))
    unless params[:user][:song] == ""
    @user.song = RSpotify::Track.search(params[:user][:song])[0].id
    end
    unless params[:user][:image_url] == ""
    @user.image_url = params[:user][:image_url]
    end
    @user.save
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    @user.update(user_params(:username, :password, :bio, :hobbies, :age, :country, :city, :phone_number, :image_url))
    if params[:user][:song] == ""
      @user.song = "5ZrDlcxIDZyjOzHdYW1ydr"
    else
      @user.song = RSpotify::Track.search(params[:user][:song])[0].id
      end
      if params[:user][:image_url] == ""
        @user.image_url = "https://252radio.com/wp-content/uploads/2016/11/default-user-image-300x300.png"
      else
      @user.image_url = params[:user][:image_url]
      end
    @user.save
    if @user.valid?
      redirect_to @user
    else
      render :edit

    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

  def check_user_belongs_to_current_user
    unless find_user == current_user
      # flashy boy
      redirect_to find_user
    end
  end

  def find_user
    @user = User.find(params[:id])
  end
end
