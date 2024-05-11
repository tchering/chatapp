class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      flash[:success] = 'Welcome back!'
      log_in @user
      redirect_to @user
    else
      flash[:danger] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'You have successfully logged out'
    redirect_to root_path
  end
end
