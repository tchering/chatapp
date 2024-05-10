class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :logged_in?

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in'
    redirect_to login_path
  end
end
