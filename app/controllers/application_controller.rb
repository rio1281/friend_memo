class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :graph
  before_filter :require_login, :except => ['landing_page', 'callback']

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def graph
    # koalaでFacebook Graph APIにアクセス
    Koala::Facebook::API.new(current_user.token)
  end

  def require_login
    redirect_to "/landing" unless current_user
  end

end
