class ApplicationController < ActionController::Base
  include SessionsHelper
	
  private
  
  def current_cart 
    if current_user
      if(Cart.find_by(user_id: current_user.id))
        cart = Cart.find_by(user_id: current_user.id)
        @current_cart = cart
      else
        cart = Cart.create(user_id: current_user.id)
        @current_cart = cart
      end
    else 
      redirect_to login_path
    end
  end
end
