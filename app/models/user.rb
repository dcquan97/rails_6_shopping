# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  has_one :cart, -> { unpaid }, class_name: Cart.name
  has_many :unpaid_items, through: :cart, source: :cart_items
  has_many :unpaid_products, through: :unpaid_items, source: :product

  has_many :carts, -> { paid }, class_name: Cart.name
  has_many :cart_items, through: :carts
  has_many :products, through: :cart_items, source: :product
  has_many :paid_products, through: :cart_items, source: :product

end
