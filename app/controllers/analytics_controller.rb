class AnalyticsController < ApplicationController
  def show
    if User.all.length > 0
    @users = User.all
    @first_user = User.all.first
    @newest_user = User.all.last
    end

    if Post.all.length > 0
    @posts = Post.all
    @oldest_post = Post.all.first
    @newest_post = Post.all.last
    end

    if Page.all.length > 0
    @pages = Page.all
    end
    
    if Friendship.all.length > 0
    @friendships = Friendship.all
    end

    if Message.all.length > 0
    @messages = Message.all
    end
  

  end
end
