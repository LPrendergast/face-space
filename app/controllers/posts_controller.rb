class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    #byebug
  end

  def create
    @post = Post.new(post_params(:title, :content,:page_id))
    @post.user_id = current_user.id
    @post.save
    redirect_to page_path(@post.page)
  end

  def edit
  end


  private

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
