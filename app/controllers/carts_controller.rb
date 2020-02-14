# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.find_by(user_id: current_user.id, completed_at: false)
    @items = @carts.cart_items
    item = @items.map(&:product_id)
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(user_id: current_user.id, completed_at: false)
    @cart.save
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  # def update
  #   respond_to do |format|
  #     if @cart.update(cart_params)
  #       format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @cart }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /carts/1
  # DELETE /carts/1.json
  # def destroy
  #   @cart.destroy
  #   respond_to do |format|
  #     format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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