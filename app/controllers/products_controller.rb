# frozen_string_literal: true

class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.page(params[:page]).per(6).padding(3)
    # @order_item = current_user.cart_items.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end
end
