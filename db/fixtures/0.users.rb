10.times do |n|
  User.seed do |s|
    s.email  = Faker::Internet.unique.email
    s.password  = "123"
  end
end
