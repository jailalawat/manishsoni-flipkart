class AddCategoryIdToInformation < ActiveRecord::Migration
  def change
    add_column :information, :category_id, :integer
    add_column :information, :product_id, :integer
  end
end
