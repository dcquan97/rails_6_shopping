# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show edit update destroy]
end
