class SessionsController < ApplicationController
  def new; end

  def create
    if request.env["omniauth.auth"]
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    elsif URI(request.referer).path == login_path
      @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:error] = "Incorrect Login information, try again"
        render :new
      end
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
