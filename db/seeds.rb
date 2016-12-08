# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  user = User.create(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )

  tag = Tag.create(
  name: Faker::Hipster.word
  )

  event_start_time = Faker::Time.between(DateTime.now, DateTime.now + 7)
  event = Event.create(
    organizer: user,
    name: Faker::Company.catch_phrase,
    location: Faker::Address.street_name,
    description: Faker::Hipster.paragraph(2, false, 2),
    tag_ids: [tag.id],
    start_time: event_start_time,
    end_time: (event_start_time + rand(3600..7200)),
    time_zone: (["Hawaii", "Alaska", "Pacific Time (US & Canada)", "Arizona", "Mountain Time (US & Canada)", "Central Time (US & Canada)", "Eastern Time (US & Canada)"].sample)
  )
  comment = Comment.create(user: user, event: event, content: Faker::Hipster.sentence)
end

User.create(name: 'admin', email: 'admin@example.com', password: 'password', role: 2)
