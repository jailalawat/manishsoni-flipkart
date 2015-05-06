class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_category
  before_action :authenticate_user!
  def load_category
  	@categories = Category.all
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end


# def user_is_admin?
 
#  end 
  

  def after_sign_in_path_for(resource)

     if  current_user.is_admin?
        admin_categories_path
    else
       root_path
     end 
  end

end
