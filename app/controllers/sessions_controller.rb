class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    # binding.pry
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:error] = "LOG IN DUMMY"
      # if @user.admin?
      #   flash[:success] = "Admin Logged in as #{@user.email}"
      #   redirect_to admin_dashboard_path
      # else
      #   flash[:success] = "Logged in as #{@user.email}"
      #   redirect_to dashboard_path
    end
  end

end
