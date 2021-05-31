class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address
      
      t.references :user
      t.timestamps
    end
  end
end
