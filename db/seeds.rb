# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    email: "dave@dave.com",
    password: "asdfghjkl",
    password_confirmation: "asdfghjkl",
    admin: true
  },
  {
    email: "sam@sam.com",
    password: "asdfghjkl",
    password_confirmation: "asdfghjkl"
  }
  ])

20.times do
  users << FactoryGirl.create(:user)
end


50.times do
  FactoryGirl.create(:item,
                      name: Faker::Commerce.product_name,
                      body: Faker::Lorem.paragraph(2),
                      price: Faker::Commerce.price,
                      user_id: rand(1..users.length),
                      avatar: Faker::Avatar.image)
end

# Set favicon randomly on seed
Net::HTTP.start("robohash.org") do |http|
  r = http.get("/#{Faker::Lorem.word}.png?size=16x16")
  File.open("./app/assets/images/favicon.png", "wb") do |file|
    file.write(r.body)
  end
end
