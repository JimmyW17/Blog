class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    def logged_in?
      # ||= means 'or assign this value to a variable'
      # So if you did something like x ||= ythis meansx || x = y so if x is nil or false set x to be the value of y.
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
end
