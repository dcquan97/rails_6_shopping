# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    carts = Cart.find_by(user_id: current_user.id, completed_at: false)
    if carts.nil?
      current_user.build_cart(completed_at: false)
      current_user.save
    end
  end

  def create
    item = current_user.cart.cart_items.create product_id: params[:product_id]
    item.save
    redirect_to '/carts'
  end
end
