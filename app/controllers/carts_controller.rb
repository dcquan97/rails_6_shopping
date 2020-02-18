# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    carts = Cart.find_or_create_by(user_id: current_user.id, completed_at: false)
    if carts.nil?
      redirect_to products_path, alert: 'Failed to create shopping cart'
    end
  end

  def create
    item = current_user.cart.cart_items.create product_id: params[:product_id]
    if item.nil?
      redirect_to product_path(params[:product_id]), alert: 'Failed to add to cart'
    end
    redirect_to carts_path
  end
end
