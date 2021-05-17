class CreateAddItems < ActiveRecord::Migration[6.1]
  def change
    create_table :add_items do |t|
      t.integer :quantity
      
      t.references :cart
      t.references :product

      t.timestamps
    end
  end
end
