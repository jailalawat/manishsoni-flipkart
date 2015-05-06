class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :sub_category_id

      t.timestamps null: false
    end
  end
end
