# frozen_string_literal: true

class CartItemsController < ApplicationController

  def destroy
    begin
      current_user.cart.cart_items.find_by!(id: params[:id]).destroy
    rescue
        redirect_to carts_path, alert: 'Not Found'
    end
    redirect_to carts_path
  end
end
