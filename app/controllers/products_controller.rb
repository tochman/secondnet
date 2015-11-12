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
byebug
      if params[:images]
        byebug
        #===== The magic is here ;)
        params[:images].each { |image|
          @product.pictures.create(image: image)
        }
      end

      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      flash[:notice] = 'Product was updated successfully!'
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Product was deleted successfully!'
    redirect_to products_path
  end

  def get_my_products
    @products = Product.all
    render 'my_products'
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :images)
  end

end
