30.times do |n|
  Product.seed do |a|
    a.name  = Faker::Games::LeagueOfLegends.champion
    a.price = rand(100)
  end
end
