class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_admin
	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
	end 

	def show
   @category = Category.find(params[:id])
   
  end

  def edit
  @category = Category.find(params[:id])
	end

	def update
  @category = Category.find(params[:id])
 
  if @category.update(categories_params)
    redirect_to admin_categories_path
  else
    render 'edit'
  end
end

	def create
	if	params[:category][:sub_category_id].present?
  	 @cat =  Category.find(params[:category][:sub_category_id])
  	 @category = @cat.subcategories.build(categories_params)
  else
  	@category = Category.new(categories_params)
  end
 
  if @category.save
  	if @category.parent.present?
  		redirect_to admin_category_path(@category.parent)
  	else
  		redirect_to admin_category_path(@category)
  	end
  else
	render 'new'
  end
end 


def destroy
 @category = Category.find(params[:id])
  @category.destroy
  redirect_to admin_categories_path
end
 
	private
  def categories_params
    params.require(:category).permit(:name)
  end
  def user_is_admin
    (redirect_to root_path , alert: 'unauthorized access') unless current_user.is_admin?
  end

end
