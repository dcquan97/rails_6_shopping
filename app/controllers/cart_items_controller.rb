# frozen_string_literal: true

class CartItemsController < ApplicationController

  def destroy
    cart.cartitems.destroy(product_id: params[:value], cart_id: current_user.cart.id)
    redirect_to '/carts'
  end
end
