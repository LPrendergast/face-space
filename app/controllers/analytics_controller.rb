class AnalyticsController < ApplicationController
  def show
    @users = User.all
    @posts = Post.all
    @pages = Page.all
    @friendships = Friendship.all
    @messages = Message.all
    @first_user = User.all.first
    @newest_user = User.all.last
    @oldest_post = Post.all.first
    @newest_post = Post.all.last
  end
end
