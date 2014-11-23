class SearchController < ApplicationController
  def index
  	@categories = Category.all
  end

  def search
  	@categories = Category.all
  	@tags = []
  	@posts = []
  	cat_param = params[:category_tag]
  	cat_param.each_value do |val|
  		@tags << val
  	end
  	@tags = @tags.compact.uniq

  	@tags.each do |tag|
  		if !tag.blank?
  			@posts.concat(Tag.find(tag).posts)
  		end
  	end
  	@posts.uniq!
  end
end
