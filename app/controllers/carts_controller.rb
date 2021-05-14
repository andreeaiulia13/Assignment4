class CartsController < ApplicationController
  include CartsHelper
  
  def show
    if logged_in?
      @cart = @current_cart 
    else 
      redirect_to login_path
    end
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil

    redirect_to root_path
  end
end
