class Category < ActiveRecord::Base
	has_many :tags , dependent: :destroy
	has_and_belongs_to_many :posts
end
