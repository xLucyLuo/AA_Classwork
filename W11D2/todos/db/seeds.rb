# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Todo.destroy_all
# User.destroy_all
# Transaction.destroy_all
# Like.destroy_all

puts "Creating todos..."

wash_car_todo = Todo.create!(title: "Wash Car", body: "at the carwash", done: false)
wash_hair_todo = Todo.create!(title: "Wash Hair", body: 'with conditioner', done: false)
clean_apartment = Todo.create!(title: "Clean Apartment", body: "Make it super clean", done: false)
buy_groceries = Todo.create!(title: "Buy Groceries", body: "yogurt, bread, eggs for Lucy", done: false)
