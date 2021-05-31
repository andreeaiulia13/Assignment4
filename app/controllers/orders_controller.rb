class OrdersController < ApplicationController
  before_action :current_cart
 
  def index
    @orders = Order.paginate(page: params[:page], per_page: 5)
  end

  def show
    @order = Order.where(user_id: current_user.id)
  end

  def new
    order = Order.new
  end

  def create 
    @order = Order.create(order_params)
    @order.update_column(:user_id, current_user.id)
   
    @current_cart.cart_items.each do |item|
      @order_item = OrderItem.new
      @order_item.quantity = item.quantity
      @order_item.product_id = item.product_id
      @order_item.order_id = @order.id
      @order_item.save
    end
    
    @current_cart.destroy
    
    redirect_to @order, notice: 'Order was successfully created.'
  
  rescue ActiveRecord::ActiveRecordError 
    flash[:danger] = @order.errors.full_messages.to_sentence
    
    redirect_to carts_show_path
  end

  def deliver
    @order = Order.find(params[:id])
    @order.update_column(:handled, true)

    redirect_to orders_path
  end
  
  private
  
    def order_params
      params.require(:order).permit(:name, :email, :address)
    end
end
