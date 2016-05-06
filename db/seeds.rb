# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  event_start_time = Faker::Time.between(DateTime.now, DateTime.now + 7)
  Event.create(
    name: Faker::Company.catch_phrase,
    description: Faker::Hipster.paragraph(2, false, 2),
    start_time: event_start_time,
    end_time: (event_start_time + rand(3600..7200))
    )
  Location.create(
    name: Faker::Address.street_name,
    description: Faker::Hipster.paragraph(2, false, 2)
    )
  User.create(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    )
  Comment.create(content: Faker::Hipster.sentence)
end

counter = 1
# Event.all.each do |event|
#   location = Location.find(counter)
#   event.location = location
#   event.save
#   location.save
#   counter += 1
# end
Location.all.each do |location|
  event = Event.find(counter)
  location.events << event
  location.save
  counter += 1
end
