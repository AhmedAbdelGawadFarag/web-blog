class UserSessionController < ApplicationController

  skip_before_action :checkAUTH, only: [:new, :logout, :create]

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


    if user != nil
      bcrypt_password = BCrypt::Password.new(user.password)
      if bcrypt_password.is_password?(password) == true
        return true
      else
        return false
      end
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