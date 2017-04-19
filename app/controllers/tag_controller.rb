class TagController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new

    tag.name = params['tag']['name']

    if tag.save
      flash[:success] = 'タグの新規作成に成功しました'
      redirect_to tag_index_path
    else
      flash[:danger] = 'タグの新規作成に失敗しました'
      redirect_to tag_index_path
    end
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    tag = Tag.find(params[:id])

    tag.name = params['tag']['name']

    if tag.save
      flash[:success] = 'タグの新規作成に成功しました'
      redirect_to tag_index_path
    else
      flash[:danger] = 'タグの新規作成に失敗しました'
      redirect_to tag_index_path
    end
  end
  
  def destroy
    tag = Tag.find(params[:id])

    if tag.delete
      flash[:success] = 'タグの削除に成功しました'
      redirect_to tag_index_path
    else
      flash[:danger] = 'タグの削除に失敗しました'
      redirect_to tag_index_path
    end
  end
end
