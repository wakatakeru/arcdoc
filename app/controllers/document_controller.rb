class DocumentController < ApplicationController
  def index
    @document = Document.all
  end

  def show
    @document = Document.find(params['id'])
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
    @document = Document.find(params['id'])
  end

  def update
    @document = Document.find(params['id'])
    
    @document.title   = params['document']['title']
    @document.content = params['document']['content']
   
    if @document.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @document = Document.find(params['id'])
    
    if @document.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end



