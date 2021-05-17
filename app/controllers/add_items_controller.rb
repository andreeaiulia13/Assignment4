class AddItemsController < ApplicationController
  before_action :current_cart

  def create
    chosen_product = Product.find(params[:product_id])
  
    if @current_cart.products.include?(chosen_product)
      @add_item = @current_cart.add_items.find_by(:product_id => chosen_product)
      @add_item.quantity += 1
    else
      @add_item = AddItem.new(quantity: 1)
      @add_item.cart = @current_cart
      @add_item.product = chosen_product
    end
  
    @add_item.save

    redirect_to cart_path(@current_cart)
  end

  def destroy
    @add_item = AddItem.find(params[:id])
    @add_item.destroy

    redirect_to cart_path(@current_cart)
  end  

  def add_quantity
    @add_item = AddItem.find(params[:id])
    @add_item.quantity += 1
    @add_item.save
		
    redirect_to cart_path(@current_cart)
  end
	
  def reduce_quantity
    @add_item = AddItem.find(params[:id])
		
    if @add_item.quantity > 1
      @add_item.quantity -= 1
    end
		
    @add_item.save
		
    redirect_to cart_path(@current_cart)
  end

  def total_price
    self.quantity * self.product.price
  end
	
  private

  def add_items_params
    params.require(:add_item).permit(:quantity, :product_id, :cart_id)
  end
end
