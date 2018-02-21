# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "Satoshi Nakamoto",
             email: "satoshi@nakamoto.com",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(name:  "uno",
              email: "uno@mail.com",
              password: "123456",
              password_confirmation: "123456")

User.create!(name:  " dos",
              email: "dos@mail.com",
              password:              "123456",
              password_confirmation: "123456")


9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@mail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


users = User.order(:created_at).take(6)
10.times do
  title = Faker::Lorem.sentence(5)
  users.each { |user| user.trips.create!(title: title) }
end
