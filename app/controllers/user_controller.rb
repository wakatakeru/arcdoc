class UserController < ApplicationController

  before_filter :login_check, :expect => ['new', 'create']
  
  def index
    user = User.find(session[:login_id])
    if user[:is_admin] == false
      flash[:danger] = "表示する権限がありません"
      redirect_to root_index_path
    end
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    flash[:warning] = "このアカウントには管理者権限が付与されます" if User.all.empty?
  end

  def create
    user = User.new

    user.login_id              = params['login_id']
    user.screen_name           = params['screen_name']
    user.password              = params['password']
    user.password_confirmation = params['password_confirmation']

    user.is_admin = false
    user.is_admin = true if User.all.empty?

    if user.save
      flash[:success] = "ユーザを正常に登録しました"
      flash[:info] = "ユーザを管理者として正常に登録しました" if user == User.first
      redirect_to login_path
    else
      flash[:danger] = "ユーザが登録できませんでした。ユーザ名を変更してください"
      @user = user
      render 'new'
    end
  end

  def edit
    if session[:login_id].to_i != params[:id].to_i
      flash[:danger] = "ページの表示権限がありません"
      redirect_to root_index_path
    end
    @user = User.find(params[:id].to_i)
  end

  def update
    user = User.find(params[:id].to_i)

    user.secreen_name          = params['user']['screen_name']
    user.password              = params['user']['password']
    user.password_confirmation = params['user']['password_confirmation']

    if user.save
      flash[:success] = "ユーザ情報を正常に変更しました"
      redirect_to root_index_path
    else
      flash[:danger] = "ユーザが登録できませんでした。パスワードが一致しません"
      @user = user
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id].to_i)
    if !User.all.empty? && user.is_admin != true && user.destroy
      flash[:success] = "ユーザを正常に削除しました"
      redirect_to login_path
    else
      flash[:danger] = "ユーザを削除できません"
      redirect_to user_index_path
    end
  end

  private

  def login_check
    is_login
  end
  
end

