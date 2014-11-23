class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def new
    @category = Category.new(intro: 'Please choose tag to sort by')
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully"
      redirect_to(action: 'show', id: @category.id)
    else
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Category updated successfully"
      redirect_to(action: 'show', id: @category.id)
    else
      render('edit')
    end
  end

  def destroy
    category = Category.find(params[:id]).destroy
    flash[:notice] = "Category with name: '#{category.name}' destroyed successfully"
    redirect_to(action: 'index')
  end

  private
    def category_params
      params.require(:category).permit(:name, :intro)
    end
end
