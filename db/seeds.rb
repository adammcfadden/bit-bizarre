# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    email: "dave@dave.com", password: "asdfghjkl", password_confirmation: "asdfghjkl", admin: true
  },
  {
    email: "sam@sam.com", password: "asdfghjkl", password_confirmation: "asdfghjkl"
  }
  ])
