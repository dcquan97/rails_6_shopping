product_ids = Product.ids
5.times do |n|
  User.all.each do |user|
    ActiveRecord::Base.transaction do
      u_cart = user.carts.create!(completed_at: Faker::Boolean.boolean)
      u_cart.cart_items.create! product_id: product_ids.sample
    end
  end
end
