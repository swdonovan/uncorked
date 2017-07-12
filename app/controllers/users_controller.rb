class UsersController < ApplicationController

  before_action :require_no_user, only: [:new]

  def new
    @user = User.new
  end

  def show
  end

  private
    def require_no_user
      redirect_to user_path(current_user), warning: "You are already logged in.  Logout first to create a new account." if current_user
    end
end
