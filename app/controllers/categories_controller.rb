class CategoriesController < ApplicationController
	def index
	  @products = Admin::Product.all
	end
	def show
	 @category = Category.find(params[:id])
	end
	def product
		 @category = Category.find(params[:category_id])
    @product = @category.products
	end 
end
