class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
  end

  def edit
  end


  private

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
