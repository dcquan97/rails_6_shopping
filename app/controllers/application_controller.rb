# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?




  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update)
  end

  def current_cart
    if !session[:user_id].nil?
      current_user.cart
    else
      Cart.new
    end
  end

  def

  def current_product
    session[:product_id]
  end


end
