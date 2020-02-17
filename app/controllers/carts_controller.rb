# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.find_or_create_by(user_id: current_user.id, completed_at: false)
  end

  def create
    @carts
    current_user.unpaid_items.find_or_create_by(product_id: params[:product_id])
    redirect_to '/carts'
  end

  def update_quantity
    current_user.unpaid_items.update_attribute(:quantity)
  end

end
