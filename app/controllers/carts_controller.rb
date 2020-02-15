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
    item = CartItem.new(cart_id: current_user.cart.id, product_id: params[:product_id])
    item.save
    redirect_to '/carts'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.require(:cart).permit(:user_id, :completed_at)
  end
end
