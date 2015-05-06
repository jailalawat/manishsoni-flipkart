class CardsController < ApplicationController
	def index 
		
		@cards = current_user.cards 
	end 
	def add_to_card
    # byebug
    @product = Admin::Product.find(params[:product_id])
  	@card=@product.cards.build('customer_id' => current_user.id)
    @card.save
    redirect_to root_path,  notice: 'Product Added.'
	end 
end