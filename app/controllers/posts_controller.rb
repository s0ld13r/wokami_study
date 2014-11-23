class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully"
      redirect_to(action: 'show', id: @post.id)
    else
      render('edit')
    end
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to(action: 'show', id: @post.id)
    else
      render('new')
    end
  end

  def destroy
    post = Post.find(params[:id]).destroy
    flash[:notice] = "Post with name: '#{post.title}' destroyed successfully"
    redirect_to(action: 'index')
  end

  private 
   def post_params
      params.require(:post).permit(:title, :description, :url,  tag_ids: [])
    end
end
