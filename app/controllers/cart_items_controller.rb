# frozen_string_literal: true

class CartItemsController < ApplicationController

  def destroy
    current_user.unpaid_items.find_by(product_id: params[:value], cart_id: current_user.cart.id).destroy
    redirect_to '/carts'
  end
end
