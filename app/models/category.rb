class Category < ActiveRecord::Base
	has_many :subcategories, class_name: "Category",
                          foreign_key: "sub_category_id",dependent: :destroy
  
 
  belongs_to :parent, class_name: "Category", foreign_key: "sub_category_id",dependent: :destroy
  validates :name, presence: true,  uniqueness: true

  has_many :products, class_name: 'Admin::Product',dependent: :destroy
  # belongs_to :information
end
                   