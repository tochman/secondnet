class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save == true
      redirect_to products_path
    else
      render 'new'
    end
  end

   def product_params
    params.require(:product).permit(:title, :description, :price)
  end

end
