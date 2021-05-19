class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total
    sum = 0
    self.cart_items.map(&:total_price).sum
  end
end
