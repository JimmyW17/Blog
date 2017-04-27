class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new(post_id: params[:post_id], user_id: session[:user_id])
  end

  def create
    user = User.find(session[:user_id])

    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    puts @post
    if @comment.save
      flash[:notice] = "Comment successfully added"
      user.comments << @comment
      redirect_to posts_path

    else
      flash[:alert] = "Error posting comment"
      redirect_to posts_path
    end
  end

  def destroy

  end
end
