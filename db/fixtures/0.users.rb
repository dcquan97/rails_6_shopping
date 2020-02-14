# frozen_string_literal: true

10.times do |_n|
  User.seed do |s|
    s.email = Faker::Internet.unique.email
    s.password = '123'
  end
end
