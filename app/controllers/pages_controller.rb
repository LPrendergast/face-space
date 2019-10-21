class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.create(page_params(:title,:content,:user_id))
    redirect_to @page
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params(:title,:content,:user_id))
  end

  def destroy
    @page = Page.find(params[:id])
    @page.delete
    redirect_to pages_path
  end

  private

  def page_params(*args)
    params.require(:page).permit(*args)
  end
end
