class UsersController < ApplicationController

  skip_before_action :checkAUTH, only: [:new, :create]

  def new
    render :new
  end

  def create

    if exist?(User.find_by_email(params[:user][:email])) == false
      @user = User.new(params.require(:user).permit(:name, :email, :password))
      @user.password = BCrypt::Password.create(@user.password)
      @user.save
      redirect_to login_url
    else
      flash[:loginfail] = "email already exists please use a diffrent email"
      redirect_to new_user_url
    end



  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def exist?(user)
    if user != nil
      return true
    end
    return false
  end
end