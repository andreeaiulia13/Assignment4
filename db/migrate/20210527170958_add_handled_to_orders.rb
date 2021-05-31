class AddHandledToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :handled, :boolean, default: false
  end
end
