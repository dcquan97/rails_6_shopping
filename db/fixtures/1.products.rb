# frozen_string_literal: true

30.times do |_n|
  Product.seed do |a|
    a.name  = Faker::Games::LeagueOfLegends.champion
    a.price = rand(100)
  end
end
