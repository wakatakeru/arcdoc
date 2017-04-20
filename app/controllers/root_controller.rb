class RootController < ApplicationController

  before_action :login_check

  def index
  end

  def login_check
    is_login
  end
end
