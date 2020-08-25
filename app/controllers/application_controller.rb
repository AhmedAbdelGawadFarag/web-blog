class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token
  helper_method :logged_in, :current_user

  before_action :checkAUTH

  def logged_in
    if session[:user_id] != nil
      return true
    else
      return false
    end
  end

  def current_user
    userid = session[:user_id]
    if userid == nil
      return nil
    end

    user = User.find(userid)
    return user
  end

  def checkAUTH
    if !logged_in
      redirect_to login_url
    end
  end

end
