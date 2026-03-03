class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    if @current_user == nil
      flash["notice"] = "You must login to post."
      redirect_to "/login"
    end
  end
  
  def create
    if @current_user == nil
      flash["notice"] = "You must login to post."
      redirect_to "/login"
      return
    end

    @post = Post.new
    @post["body"] = params["body"]
    @post["image"] = params["image"]
    @post["user_id"] = @current_user["id"]
    @post.save
    redirect_to "/posts"
  end
end
