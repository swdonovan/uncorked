class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order('last_name').paginate(:page => params[:page], :per_page => 30)
  end

  def update
    @user = User.find(params[:id])
    @user.update(role: params[:role])
    redirect_to admin_users_path
  end
end
