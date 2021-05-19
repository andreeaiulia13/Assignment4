class ApplicationController < ActionController::Base
  include SessionsHelper
	
  private
  
  def current_cart
    if session[:cart_id].present?
      cart = Cart.find(session[:cart_id])
      @current_cart = cart
    else
      session[:cart_id] = nil
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end
