class RootController < ApplicationController

  before_action :login_check

  def index
  end
  
  def login_check
    redirect_to login_path unless is_login
  end
end
