# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    email: "dave@dave.com", password: "asdfghjkl", password_confirmation: "asdfghjkl", admin: true, cart: Cart.new
  },
  {
    email: "sam@sam.com", password: "asdfghjkl", password_confirmation: "asdfghjkl"
  }
  ])

50.times do
  FactoryGirl.create(:item, name: Faker::Commerce.product_name, body: Faker::Lorem.paragraph(2), price: Faker::Commerce.price, user_id: User.all.first.id)
end
