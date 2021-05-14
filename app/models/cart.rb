class Cart < ApplicationRecord
	has_many :add_items, dependent: :destroy
  has_many :products, through: :add_items

	def total
    sum = 0

    self.add_items.each do |item|
      sum+= item.total_price
    end
		
		return sum
	end
end
