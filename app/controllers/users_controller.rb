class UsersController < ApplicationController

  before_action :require_no_user, only: [:new]
  before_action :require_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), success: "Your Account has been created."
    else
      render :new
    end
  end

  def show
  end

  def edit
    @user = current_user
  end

  private
    def require_no_user
      redirect_to user_path(current_user), warning: "You are already logged in.  Logout first to create a new account." if current_user
    end

    def require_user
      redirect_to login_path, warning: "You must be logged in to do this." unless current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :phone_number, :bio, :password)
    end
end
