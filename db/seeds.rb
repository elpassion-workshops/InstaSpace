# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Jon', last_name: 'Snow', email: 'a@example.com', password: 'qweqweqwe')
User.create(first_name: 'Hot', last_name: 'Pie', email: 'b@example.com', password: 'qweqweqwe')