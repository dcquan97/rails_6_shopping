# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    carts = Cart.find_or_create_by(user_id: current_user.id, completed_at: false)
  end

  def create
    item = current_user.cart.cart_items.create product_id: params[:product_id]
    item.save
    redirect_to '/carts'
  end
end
