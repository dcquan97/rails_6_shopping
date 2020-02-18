# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.find_or_create_by(user_id: current_user.id, completed_at: false)
  end

  def create
    @current_item = current_user.unpaid_items.find_by(product_id: params[:product_id])
    if @current_item.nil?
      current_user.cart.cart_items.create product_id: params[:product_id]
    else
      update_quantity
    end
    redirect_to '/carts'
  end

  def update_quantity
    value = @current_item.quantity +=1
    @current_item.update_attributes(quantity: value)
  end

end
