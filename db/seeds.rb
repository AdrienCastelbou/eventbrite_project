# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Participation.destroy_all

10.times do
  first_name = Faker::Name.first_name
  User.create(first_name: first_name, last_name: Faker::Name.last_name, email: "#{first_name}@yopmail.com", password: "aaaaaa" )
end

10.times do
  Event.create(start_date: Faker::Date.in_date_period, duration: rand(5..10), title: Faker::Company.name, description: Faker::Lorem.paragraphs, price: 10, location: "Paris", admin: User.all.sample)
end

5.times do
  Participation.create(user: User.all.sample, event: Event.all.sample)
end