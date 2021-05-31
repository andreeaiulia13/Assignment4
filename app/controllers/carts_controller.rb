class CartsController < ApplicationController  
  before_action :current_cart

  def new
    @cart = Cart.new
  end
  
  def show
    redirect_to login_path unless @current_cart
    
    @current_cart
  end

  def destroy
    @current_cart.destroy
    
    redirect_to root_path
  end
end
