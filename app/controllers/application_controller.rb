class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:login_id]
      @_current_user ||= User.find(session[:login_id])
    end
  end

  def is_login
    if session[:login_id] != nil
      redirect_to root_index_path
    end
  end

  helper_method :current_user
end
