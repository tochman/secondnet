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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @post = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      flash[:notice] = 'Post updated successfully!'
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
      @product.destroy
      flash[:notice] = 'Post deleted successfully!'
      redirect_to products_path
  end

  def get_my_products
    @products = Product.all
    render 'my_products'
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

end
