class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(params.require(:user).permit(:name,:email,:password))
    @user.save
  end


end
