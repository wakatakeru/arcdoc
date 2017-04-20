class TagController < ApplicationController

  before_action :login_check
  
  def index
    @tags = Tag.search(:name_cont => params[:q]).result
  end

  def show
    @tag = Tag.find(params[:id])
    @documents = @tag.documents
  end

  def new
    if current_user.is_admin == false
      flash[:danger] = "表示する権限がありません"
      redirect_to tag_index_path
    end
    @tag = Tag.new
  end

  def create
    if current_user.is_admin == false
      flash[:danger] = "表示する権限がありません"
      redirect_to tag_index_path
    end

    tag = Tag.new

    tag.name = params['tag']['name']
    tag.is_delete = true
    
    if tag.save
      flash[:success] = 'タグの新規作成に成功しました'
      redirect_to tag_index_path
    else
      flash[:danger] = 'タグ名が空です。新規作成できません。'
      redirect_to tag_index_path
    end
  end
  
  def edit
    if current_user.is_admin == false
      flash[:danger] = "表示する権限がありません"
      redirect_to tag_index_path
    end
    
    @tag = Tag.find(params[:id])
  end
  
  def update
    if current_user.is_admin == false
      flash[:danger] = "表示する権限がありません"
      redirect_to tag_index_path
    end

    tag = Tag.find(params[:id])
    
    tag.name = params['tag']['name']
    
    if tag.save
      flash[:success] = 'タグの変更に成功しました'
      redirect_to tag_index_path
    else
      flash[:danger] = 'タグ名が空です。更新できません。'
      redirect_to tag_index_path
    end
  end
  
  def destroy
    if current_user.is_admin == false
      flash[:danger] = "表示する権限がありません"
      redirect_to tag_index_path
    end

    tag = Tag.find(params[:id])

    if tag.is_delete && tag.destroy
      flash[:success] = 'タグの削除に成功しました'
      redirect_to tag_index_path
    else
      flash[:danger] = 'タグの削除に失敗しました'
      redirect_to tag_index_path
    end
  end

  private
  
  def login_check
    redirect_to login_path unless is_login
  end
end
