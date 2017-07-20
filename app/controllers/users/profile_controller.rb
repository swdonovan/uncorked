class Users::ProfileController < ApplicationController
  def show
    redirect_to login_path, warning: "You must be logged in to do this." unless current_user
    @user = current_user
  end
end
