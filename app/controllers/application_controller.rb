class ApplicationController < ActionController::Base
  include SessionsHelper
	
  private
  
  def current_cart 
    if logged_in?
      if(Cart.find_by(user_id: current_user.id))
        cart = Cart.find_by(user_id: current_user.id)
        @current_cart = cart
      else
        cart = Cart.create(user_id: current_user.id)
        @current_cart = cart
      end
    end
  end
end
