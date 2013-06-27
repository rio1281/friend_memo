class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :graph

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def graph
    # koalaでFacebook Graph APIにアクセス
    Koala::Facebook::API.new(current_user.token)
  end

end
