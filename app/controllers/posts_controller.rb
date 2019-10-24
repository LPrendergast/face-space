class PostsController < ApplicationController
  before_action :find_post, only:[:show,:edit,:update,:destroy]
  before_action :check_if_user_has_perms, only: [:edit,:update,:destroy]

  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(post_params(:title, :content, :page_id))
    @post.user_id = current_user.id
    if @post.valid?
    @post.save
    redirect_to page_path(@post.page)
    else
      
      render '_form', :locals => { page_id: params[:post][:page_id] }
    end
  end

  def edit
  end

  def update
    @post.update(post_params(:title, :content))
    if @post.valid?
    redirect_to page_path(@post.page)
    else
      render :edit
    end

  end

  def destroy
    @page = @post.page
    @post.destroy
    redirect_to @page
  end


  private

  def post_params(*args)
    params.require(:post).permit(*args)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def check_if_user_has_perms
    unless @post.user == current_user || @post.page.user == current_user
      redirect_to page_path(@post.page)
    end
  end
end
