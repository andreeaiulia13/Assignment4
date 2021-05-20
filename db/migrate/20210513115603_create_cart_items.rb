class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      
      t.references :cart
      t.references :product

      t.timestamps
    end
  end
end
