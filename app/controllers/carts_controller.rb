class CartsController < ApplicationController  
  before_action :current_cart

  def show
    if logged_in?
      @current_cart 
    else 
      redirect_to login_path
    end
  end

  def destroy
    @current_cart.destroy
    session[:cart_id] = nil

    redirect_to root_path
  end
end
