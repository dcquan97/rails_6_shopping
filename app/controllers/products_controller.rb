# frozen_string_literal: true

class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.page(params[:page]).per(6).padding(3)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find_by!(id: params[:id])
    rescue
      redirect_to '/products', alert: 'Not Found'
  end
end
