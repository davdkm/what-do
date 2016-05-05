require 'rails_helper'

RSpec.describe Event, :type => :model do
  before(:each) do
    @event = Event.first
    @user = User.first
    @user2 = User.second
    @comment = Comment.first
  end

  it 'has a location' do
    @event.location = Location.first
    expect(@event.location).to eq(Location.first)
  end

  it 'has many attendess' do
    @event.attendees << @user
    @event.attendees << @user2
    expect(@event.attendees).to include(@user)
    expect(@event.attendees).to include(@user2)
  end

  it 'has an event organizer' do
    @event.organizer = @user
    expect(@event.organizer).to eq(@user)
  end

  it 'has many comments' do
    @event.comments << Comment.first
    expect(@event.comments).to include(Comment.first)
  end

end
