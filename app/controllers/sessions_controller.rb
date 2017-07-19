class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:error] = "Incorrect Login information, try again"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully Logged out"
    redirect_to login_path
  end
end
