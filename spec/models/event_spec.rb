require 'rails_helper'

RSpec.describe Event, :type => :model do

  it 'has a location' do
    Event.first.location = Location.first
    expect(Event.first.location).to eq(Location.first)
  end

  it 'has many users' do
    Event.first.attendees << User.first, User.second
    expect(Event.first.attendees).to include(User.first, User.second)
  end

  it 'has many comments' do
    Event.first.comments << Comment.first
    expect(Event.first.comments).to include(Comment.first)
  end

end
