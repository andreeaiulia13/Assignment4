class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end

  def show; end

  def dashboard
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create!(product_params.except(:image))
    product.image.attach(product_params[:image])
      
    redirect_to dashboard_path
    
  rescue ActiveRecord::RecordInvalid
    redirect_to new_error_product_path
  end
  
  def edit; end

  def new_error
    @product = Product.new
  end

  def update
    @product.update(product_params)
   
    redirect_to dashboard_path
  end

  def destroy
    @product.destroy
    
    redirect_to dashboard_path
  end
  
  private

  def set_product
     @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end

end

