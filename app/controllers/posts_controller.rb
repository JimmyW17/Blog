class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @poster = User.find(session[:user_id])
    @post = @poster.posts.new(params[:post])
    if @post.save
      flash[:notice] = "Your post was created successfully."
      # redirect_to root_path
      puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SUCCESS'
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem creating your post."
      puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FAIL'
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post destroyed"
      redirect_to posts_path
    else
      flash[:alert] = "There was an issue deleting post"
      redirect_to posts_path(@post)
    end
  end
end
