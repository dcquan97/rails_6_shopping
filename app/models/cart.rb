class Cart < ApplicationRecord
  belongs_to :user
  has_many   :cart_items

  scope :unpaid, ->{where completed_at: false }
  scope :paid,   ->{where completed_at: true }
end
