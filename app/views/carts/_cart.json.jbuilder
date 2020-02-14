# frozen_string_literal: true

json.extract! cart, :id, :user_id, :completed_at, :created_at, :updated_at
json.url cart_url(cart, format: :json)
