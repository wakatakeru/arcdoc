class DocumentController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @document = Document.new
  end

  def create
    document = Document.new

    document.title   = params['document']['title']
    document.content = params['document']['content']
    
    if document.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end
end
