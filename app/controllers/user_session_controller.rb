class UserSessionController < ApplicationController

  def new
    render :new
  end

  def create
    if (login(params[:user][:email], params[:user][:password]))
      redirect_to posts_path
    end
  end

  def login(email, password)
    user = User.find_by_email(email)
    if (user != nil && user.password == password)
      return true
    else
      return false
    end

  end

end