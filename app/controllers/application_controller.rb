class ApplicationController < ActionController::Base
  helper_method :current_user, :user_initials

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_initials
    return unless logged_in?

    @current_user.first_name[0].upcase
  end

  def logged_in?
    current_user != nil
  end
end
