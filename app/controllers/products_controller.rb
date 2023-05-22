class ProductsController < ApplicationController
  def index
    @products = Product.all 
  end

  def new 
  end

  def create
    Product.create!(product_params)
    redirect_to products_path
  end

private 
def product_params
  params.permit(:name, :image_url, :description)
end

end
