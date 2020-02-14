class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    # binding.pry
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_items = CartItem.new(cart_id: current_cart.id ,product_id: session[:product_id])
    @cart_items.save
  end

  def updatecart_item
    @order = current_user
    @cart_item = @order.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @order.cart_items
  end

  def destroy
    @cart_items.destroy
  end

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
