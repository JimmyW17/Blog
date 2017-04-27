class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
  end

  def show
    @post = Post.find(params[:id].to_i)
    puts "dfdfd"
    # puts @post
  end

  def new
    @post = Post.new
  end

  def create
    @poster = User.find(session[:user_id])
    @post = @poster.posts.new(title:params[:post][:title], content:params[:post][:content])
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
end
