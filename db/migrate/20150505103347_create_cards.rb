class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :product_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
