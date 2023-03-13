# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Category.create(category_name: "Electrical")
Category.create(category_name: "Mechanical")
Category.create(category_name: "Medical")
Category.create(category_name: "IT")
Category.create(category_name: "Civil")
Category.create(category_name: "Household")
Category.create(category_name: "Teaching")




