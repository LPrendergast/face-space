class PagesController < ApplicationController
  before_action :check_page_belongs_to_user, only: [:edit, :update, :destroy]
  before_action :find_page, only: [:show, :edit, :update, :destroy]

  def show
    @posts = @page.posts
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params(:title,:content))
    @page.user_id = current_user.id
    
    if @page.valid?
    @page.save
    redirect_to @page
    else
      render :new
    end
  end

  def edit
  end

  def update
    @page.update(page_params(:title,:content))
    if @page.valid?
    redirect_to @page
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path
  end

  private

  def page_params(*args)
    params.require(:page).permit(*args)
  end

  def check_page_belongs_to_user
    unless find_page.user == current_user
      #flashy boy
      redirect_to pages_path
    end
  end

  def find_page
     @page = Page.find(params[:id])
  end
end
