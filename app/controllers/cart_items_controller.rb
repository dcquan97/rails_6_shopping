# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show edit update destroy]



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id)
  end
end
