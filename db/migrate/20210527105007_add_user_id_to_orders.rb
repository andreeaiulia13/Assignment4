class AddUserIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :order_id, :integer
  end
end
