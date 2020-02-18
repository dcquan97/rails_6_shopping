# frozen_string_literal: true

class CartItemsController < ApplicationController

  def destroy
    current_user.cart.cart_items.find_by!(id: params[:id]).destroy
      rescue
        redirect_to carts_path, alert: 'Not Found'
      else
        redirect_to carts_path
  end
end
