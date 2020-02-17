# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    carts = Cart.find_or_create_by(user_id: current_user.id, completed_at: false)
  end

  def create
    current_item = CartItem.find_by(cart_id: current_cart.id, product_id: params[:product_id])
    if current_item.nil?
      item = current_user.cart.cart_items.create(product_id: params[:product_id], quantity: 1)
      item.save
    else
      CartItem.update_columns quantity: "#{params[:quantity] + 1}"
    end

    redirect_to '/carts'
  end
end
