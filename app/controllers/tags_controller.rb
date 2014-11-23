class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
    @categories = Category.all
  end

  def create
     @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag created successfully"
      redirect_to(action: 'show', id: @tag.id)
    else
      render('new')
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    @categories = Category.all
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      flash[:notice] = "Tag updated successfully"
      redirect_to(action: 'show', id: @tag.id)
    else
      render('edit')
    end
  end

  def destroy
    tag = Tag.find(params[:id]).destroy
    flash[:notice] = "Tag with name: '#{tag.name}' destroyed successfully"
    redirect_to(action: 'index')
  end
  private
    def tag_params
      params.require(:tag).permit(:name, :category_id)
    end
end
