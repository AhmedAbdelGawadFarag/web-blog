class UserSessionController < ApplicationController

  def new
    render :new
  end

  def create
    if login params[:user][:email], params[:user][:password]
      user = User.find_by_email(params[:user][:email])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:loginfail] = "email or password is incorrect"
      redirect_to login_url
    end
  end

  def login(email, password)
    user = User.find_by_email(email)
    if user != nil && user.password == password
      return true
    else
      return false
    end

  end

  def home
    render :home
  end

  def logout
    session[:user_id] = nil
    redirect_to login_url
  end

end