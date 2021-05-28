class CartItemsController < ApplicationController
  before_action :current_cart

  def new
    @cart_item = CartItem.new
  end
  
  def create
    chosen_product = Product.find(params[:product_id])
  
    if @current_cart.products.include?(chosen_product)
      @cart_item = @current_cart.cart_items.find_by(product_id: chosen_product)
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.cart = @current_cart
      @cart_item.product = chosen_product
    end
  
    @cart_item.save
  
    if @cart_item.save
      flash[:success] = "Product successfully added to the cart"
    end
    redirect_to root_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    redirect_to cart_path(@current_cart)
  end  

  def add_quantity
    @cart_item = CartItem.find(params[:id])

    new_quantity = @cart_item.quantity + 1
    @cart_item.update(quantity: new_quantity)
		
    redirect_to cart_path(@current_cart)
  end
	
  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
		
    if @cart_item.quantity > 1
      new_quantity = @cart_item.quantity - 1
      @cart_item.update(quantity: new_quantity)

      redirect_to cart_path(@current_cart)
    end    
  end

  def total_price
    self.quantity * self.product.price
  end
	
  private

  def add_items_params
    params.require(:cart_item).permit(:quantity, :product_id, :cart_id)
  end
end
