class UsersController < ApplicationController

  skip_before_action :checkAUTH, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))
    @user.save
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

end
