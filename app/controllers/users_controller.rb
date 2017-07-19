class UsersController < ApplicationController

  before_action :require_no_user, only: [:new]
  before_action :require_user, only: [:show, :edit]
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Save the user_id to the session object
      session[:user_id] = @user.id

      # Create user on Authy, will return an id on the object
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)

      # Send an SMS to your user
      Authy::API.request_sms(id: @user.authy_id)

      redirect_to verify_path
    else 
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), success: "Profile updated"
    else
      render :edit
    end
  end
  def show_verify
    return redirect_to new_user_path unless session[:user_id]
  end

  def verify
    @user = current_user

    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?
      @user.update(verified: true)

      send_message("You did it! Signup complete :)")

      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    @user = current_user
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = 'Verification code re-sent'
    redirect_to verify_path
  end

  private


  private
    def require_no_user
      redirect_to user_path(current_user), warning: "You are already logged in.  Logout first to create a new account." if current_user
    end

    def require_user
      redirect_to login_path, warning: "You must be logged in to do this." unless current_user
    end

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :phone_number, :bio, :password, :country_code)
    end
    def send_message(message)
      @user = current_user
      twilio_number = ENV['TWILIO_NUMBER']
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']
      message = @client.api.accounts(account_sid).messages.create(
        :from => twilio_number,
        :to => @user.country_code+@user.phone_number,
        :body => message
      )
    end
end
