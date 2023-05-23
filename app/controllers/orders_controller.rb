class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def order_params 
    params.require(:products).permit(:product_id, :quantity)
  end

end