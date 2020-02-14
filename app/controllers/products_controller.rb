class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    # @order_item = current_user.cart_items.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    session[:product_id] = @product.id
  end


end
