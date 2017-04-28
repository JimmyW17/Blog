class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      puts 'SessionStart'+'@'*45
      redirect_to root_path
    else
      puts 'X'*30
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    puts 'SessionEnd'+'@'*45
    redirect_to root_path
  end
end
