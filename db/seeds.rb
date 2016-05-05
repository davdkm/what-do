# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  Event.create(
    name: Faker::Company.buzzword
  )
  Location.create(name: Faker::Address.street_name)
  User.create(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    )
  Comment.create(content: Faker::Hipster.sentence)
end

counter = 1
Event.all.each do |event|
  event.location_id = counter
  event.save
  counter += 1
end
