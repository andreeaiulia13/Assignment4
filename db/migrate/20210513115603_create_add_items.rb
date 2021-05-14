class CreateAddItems < ActiveRecord::Migration[6.1]
  def change
    create_table :add_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
